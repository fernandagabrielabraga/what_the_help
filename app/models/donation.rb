class Donation < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category

  has_many :confirmations

  validates :description, presence: true, length: { in: 10..200 }
  validates :image, :location, :quantity, :donation_name, presence: true
end
