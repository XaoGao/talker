class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :pictures, as: :imageable
  has_many :articles, foreign_key: 'author_id'

  has_many :friendships
  has_many :subscribers, through: :friendships

  has_many :owner_dialogs, foreign_key: 'owner_id'

  has_many :dialog_members, foreign_key: 'member_id'
  has_many :dialogs, through: :dialog_members

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 150 }
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }

  scope :all_active, -> { where(lock: false) }
  scope :all_except, ->(user) { where.not(id: user) }

  def full_name
    "#{last_name} #{first_name}"
  end

  def subscriptions
    Friendship.subscriptions(id)
  end

  def alredy_subscription?(user)
    Friendship.find_by(user: id, subscriber_id: user).present?
  end
end
