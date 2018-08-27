class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_requests
  has_many :requests, through: :dog_requests, dependent: :destroy
  validates :name, presence: true

end
