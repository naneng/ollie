class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_requests, dependent: :destroy
  validates :name, presence: true

end
