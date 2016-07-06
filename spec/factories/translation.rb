FactoryGirl.define do
  factory :translation do
    pid 300100
    words 10
    input_text 'Example text here'
    output_text ''
    source_language 'english'
    target_language 'hindi'
  end
end
