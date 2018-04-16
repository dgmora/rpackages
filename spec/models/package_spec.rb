RSpec.describe Package do
  it 'has a valid factory' do
    expect(build(:package)).to be_valid
    expect(build(:package, name: '')).to be_invalid
  end
end
