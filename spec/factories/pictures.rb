FactoryBot.define do
  factory :picture do
    comments_count { 0 }
    association :imageable, factory: :article
    is_main { true }
    title { 'picture_title' }

    trait :with_image do
      after :create do |picture|
        file_path = Rails.root.join('spec', 'support', 'assets', 'test.png')
        file = fixture_file_upload(file_path, 'image/png')
        picture.image.attach(file)
      end
    end
  end
end
