FactoryBot.define do
  factory :envfile do
    filename { Faker::File.file_name.split('/').last }
    filetype { Faker::File.extension }
  end
end
