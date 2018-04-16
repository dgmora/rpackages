RSpec.describe PackageHelper do
  describe '.humanize_person_array' do
    it 'shows a pretty string' do
      arr = [{name: 'me', email: 'me@me.com'}, {name: 'you'}]
      expect(helper.humanize_person_array(arr)).to eq 'me <me@me.com>, you'
    end
  end
end
