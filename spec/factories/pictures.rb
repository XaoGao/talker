# == Schema Information
#
# Table name: pictures
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0), not null
#  imageable_type :string           not null
#  is_main        :boolean          default(FALSE), not null
#  likes_count    :integer          default(0), not null
#  title          :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
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
