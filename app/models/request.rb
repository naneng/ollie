class Request < ApplicationRecord
  belongs_to :user
  has_many :dog_requests

  validates :pickup_location, presence: true
  validates :dropoff_location, presence: true

end
