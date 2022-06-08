class Vehicle < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  CATEGORIES = %w[bike skate rolling-skates ice-skates scooter]
  validates :vehicle_type, inclusion: { in: CATEGORIES }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
