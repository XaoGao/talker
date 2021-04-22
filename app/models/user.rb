# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  city                   :string           default(""), not null
#  comments_count         :integer          default(0), not null
#  country                :string           default(""), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  date_of_birth          :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  gender                 :integer          default("not_set"), not null
#  interests              :string           default(""), not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  likes_count            :integer          default(0), not null
#  lock                   :boolean          default(FALSE), not null
#  online                 :boolean          default(FALSE), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  status                 :string           default(""), not null
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include Activeable
  include Orderable
  include Picturable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum gender: { not_set: 0, man: 1, woman: 2, another: 3 }

  has_many :pictures, as: :imageable
  has_many :articles, foreign_key: 'author_id'

  has_many :friendships
  has_many :subscribers, through: :friendships

  has_many :owner_dialogs, foreign_key: 'owner_id'

  has_many :dialog_members, foreign_key: 'member_id'
  has_many :dialogs, through: :dialog_members

  has_many :likes
  has_many :comments

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 150 }
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }

  scope :all_except, ->(user) { where.not(id: user) }

  def main_photo
    pictures.find { |picture| picture.is_main }
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def subscriptions
    Friendship.subscriptions(id)
  end

  def alredy_subscription?(user)
    Friendship.find_by(user: id, subscriber_id: user).present?
  end

  def all_unread_messages
    unread_messages = 0
    dialogs.each { |dialog| unread_messages += dialog.unread_messages_count(self) }
    unread_messages
  end

  def any_unread_messages?
    dialogs.each do |dialog|
      return true if dialog.unread_messages?(self)
    end
    false
  end

  def gender_name
    case gender
    when 'not_set'
      'Не указан'
    when 'man'
      'Мужской'
    when 'woman'
      'Женский'
    when 'another'
      'Другой'
    end
  end

  def location
    user_location = [initial_filed(country), initial_filed(city)].compact.join(', ')
    return user_location if user_location.present?

    '-'
  end

  private

  def initial_filed(field)
    field unless field.blank?
  end
end
