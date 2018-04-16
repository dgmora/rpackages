require 'sidekiq/testing'
require 'timecop'

RSpec.describe NewPackagesWorker do

  it 'stores new packages' do
    Timecop.freeze(Time.parse('2015-08-16 23:15:52')) do
      described_class.new.perform(amount: 1)
    end
    expect(Package.where(name: 'A3').count).to eq 1
  end

  it 'does not store old packages' do
    described_class.new.perform(amount: 1)
    expect(Package.where(name: 'A3').count).to eq 0
  end

  it 'ignores existing packages' do
    create(:package, name: 'A3', version: '1.0.0')
    Timecop.freeze(Time.parse('2015-08-16 23:15:52')) do
      expect { described_class.new.perform(amount: 1) }.not_to raise_error
    end
    expect(Package.where(name: 'A3').count).to eq 1
  end
end

