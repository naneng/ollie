class Request < ApplicationRecord
<<<<<<< HEAD
  belongs_to :dog through: :dog_requests
  belongs_to :user
  has_many :dog_requests

  validates :pickup_location, presence: true
  validates :dropoff_location, presence: true

end
