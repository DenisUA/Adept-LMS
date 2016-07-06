class Translation < ActiveRecord::Base
  LANGUAGES = %w[Mandarin Spanish English Hindi].freeze

  validates :input_text, presence: true
end
