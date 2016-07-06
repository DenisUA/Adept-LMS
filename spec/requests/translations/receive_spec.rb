require 'rails_helper'
describe 'Translation' do
  describe 'POST /translation_receive' do
    let(:translation) { create :translation }

    context 'with valid params' do
      it 'updates output text' do
        post "/translation/#{translation.id}/receive", pid: 300100,
                                                       t: 'hindi',
                                                       text: 'Translated text'

        translation.reload

        expect(translation.output_text).to eq('Translated text')
        expect(response.status).to eq(200)
      end
    end
  end
end
