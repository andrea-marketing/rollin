class Vehicle < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_one_attached :photo

  CATEGORIES = %w[bike skate rolling-skates ice-skates scooter]
  validates :vehicle_type, inclusion: { in: CATEGORIES }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
