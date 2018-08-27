class Request < ApplicationRecord
  belongs_to :user
  has_many :dog_requests, dependent: :destroy
  has_many :dogs, through: :dog_requests
  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :dogs

  validates :pickup_location, presence: true
  validates :dropoff_location, presence: true
  validates :datetime, presence: true
  geocoded_by :pickup_location
  after_validation :geocode, if: :will_save_change_to_pickup_location?
end
