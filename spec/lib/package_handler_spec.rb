RSpec.describe PackageHandler do

  before do
    allow(PackageHandler).to receive(:open)
      .and_return(StringIO.new(packages_list))
  end

  describe '.run' do
    before do 
      # This mock could be removed when PackageReader is
      # implemented but then this test would depend on PackageReader
      expect_any_instance_of(PackageReader).to receive(:read)
        .and_return(attributes_for(:package))
    end

    it 'returns an array of packages' do
      result = described_class.run(1)
      expect(result).to be_an Array
      expect(result.size).to eq 1
      expect(result[0][:name]).to eq 'A3'
      expect(result[0][:version]).to eq '1.0.0'
      expect(result[0][:title]).to eq 'The 3 As'
    end
  end

  describe '.read_packages_list' do
    let(:result) { PackageHandler.read_packages_list }
    it 'makes the package list an array of hashes' do
      expect(result).to be_an Array
      expect(result.size).to eq 2
      expect(result[0][:name]).to eq 'A3'
      expect(result[0][:version]).to eq '1.0.0'
      expect(result[1][:name]).to eq 'abbyyR'
      expect(result[1][:version]).to eq '0.5.1'
    end
  end
end
