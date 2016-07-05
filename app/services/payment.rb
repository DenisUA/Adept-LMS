class Payment
  include ApplicationHelper

  def initialize(translation)
    @translation = translation
  end

  def estimate
    HTTParty.post(
      'http://www.translated.net/hts/',
      body: {
        f: 'quote',
        cid: 'htsdemo',
        p: 'htsdemo5',
        s: @translation.source_language.downcase,
        t: @translation.target_language.downcase,
        w: words_count(@translation.input_text),
        text: @translation.input_text,
        df: 'pdf',
        endpoint: Rails.application.routes.url_helpers.translation_receive_path(@translation)
      }
    )
  end

  def perform
    @result = HTTParty.post(
      'http://www.translated.net/hts/',
      body: {
        f: 'confirm',
        cid: 'htsdemo',
        p: 'htsdemo5',
        pid: @translation.pid,
        c: 1,
        sandbox: 1
      }
    )
  end
end
