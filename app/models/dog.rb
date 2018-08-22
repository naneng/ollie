class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_requests
  validates :name, presence: true

end
