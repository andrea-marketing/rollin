class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  include PgSearch::Model
  multisearchable against: [:price]
end
