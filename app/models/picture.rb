# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  imageable_type :string           not null
#  is_main        :boolean          default(FALSE), not null
#  title          :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :image

  has_many :likes
  has_many :comments

  validates :title, presence: true
end
