class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :confirmations
end
