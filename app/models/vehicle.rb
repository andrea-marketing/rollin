class Vehicle < ApplicationRecord
  belongs_to :user, dependent: :destroy

  CATEGORIES = %w[bike skate rolling-skates ice-skates scooter]
  validates :vehicle_type, inclusion: { in: CATEGORIES}
end
