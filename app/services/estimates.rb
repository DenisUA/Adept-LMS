class Estimates
  def initialize(translation)
    @translation = translation
  end

  def perform
    @result = HTTParty.post(
      'http://www.translated.net/hts/',
      body: {
        f: 'quote',
        s: @translation.source_language,
        t: @translation.target_language,
        w: words_count(@translation.input_text),
        text: @translation.input_text,
        df: 'pdf',
        endpoint: translation_receive_path
      }.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
