class Donation < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category

  has_many :confirmations

  validates :description, presence: true, length: { in: 10..200 }
  validates :image, :location, :quantity, :donation_name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_donation_name_and_description,
                  against: [ :donation_name, :description ],
                  using: {
                    tsearch: { prefix: true } # <-- now half of the word will return something!
                  }
end
