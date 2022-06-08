class Vehicle < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_one_attached :photo

  CATEGORIES = %w[bike skate rolling-skates ice-skates scooter]
  validates :vehicle_type, inclusion: { in: CATEGORIES }
end
