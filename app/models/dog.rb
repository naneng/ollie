class Dog < ApplicationRecord
  belongs_to :user
  has_many :requests through: :dog_requests

  validates :name, presence: true
end
