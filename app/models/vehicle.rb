class Vehicle < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  CATEGORIES = ["bike", "skate", "rolling skates", "ice skates", "scooter"]

  validates :vehicle_type, inclusion: { in: CATEGORIES }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :vehicle_type, :name, :address ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
