class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :pictures, as: :imageable
  has_many :articles, foreign_key: 'author_id'

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 150 }
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }

  scope :all_active, -> { where(lock: false) }

  def full_name
    "#{last_name} #{first_name}"
  end
end
