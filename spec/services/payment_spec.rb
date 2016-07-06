require 'rails_helper'
describe Payment, :vcr do
  let(:translation) { create :translation, pid: '14797168' }

  context 'when valid query is given' do
    it 'returns estimates' do
      expect(described_class.new(translation).estimate.split("\n")).to eq(
        ['1', 'OK', '2016-07-07T10:30:00Z', '3', '9.50', '14797168']
      )
    end

    it 'returns returns translated text' do
      expect(described_class.new(translation).perform.split("\n")).to eq(%w[1 OK])
    end
  end

  context 'when invalid query is passed' do
    it 'returns error' do
      expect(described_class.new(translation).perform.split("\n")).to eq [
        '0', "THIS ORDER (#{translation.pid}) CANNOT BE CONFIRMED"
      ]
    end
  end
end
