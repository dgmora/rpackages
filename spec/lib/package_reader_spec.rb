RSpec.describe PackageReader do

  before { mock_package('A3', '1.0.0') }

  describe '#read' do
    let(:result) { described_class.new('A3', '1.0.0').read }
    it 'gets the content' do
      expect(result[:title]).to start_with 'Accurate, Adaptable, and Accessible'
      expect(result[:authors]).to eq [name: 'Scott Fortmann-Roe']
      expect(result[:maintainers]).to eq [name: 'Scott Fortmann-Roe', email: 'scottfr@berkeley.edu']
      expect(result[:publication_date]).to be_a Time
    end
  end
end
