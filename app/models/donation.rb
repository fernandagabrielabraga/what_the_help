class Donation < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category

  has_many :confirmations
  has_many :chatrooms, dependent: :destroy

  validates :description, presence: true, length: { in: 10..550 }
  validates :image, :location, :quantity, :donation_name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_donation_name_and_description,
                  against: [:donation_name, :description],
                  using: {
                    tsearch: { prefix: true } # <-- now half of the word will return something!
                  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
