class Request < ApplicationRecord
  belongs_to :dog through: :dog_requests
  belongs_to :user

  validates :pickup_location, presence: true
  validates :dropoff_location, presence: true
end
