class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :donations
  has_many :confirmations
  has_many :chatrooms, through: :donation

  has_one_attached :avatar

  validates :avatar, file_size: { less_than_or_equal_to: 1.megabytes },
            file_content_type: { allow: ['image/jpeg', 'image/svg', 'image/png', 'image/gif'] }
end
