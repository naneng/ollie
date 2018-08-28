class Dog < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :dog_requests
  has_many :requests, through: :dog_requests, dependent: :destroy
=======
  has_many :dog_requests, dependent: :destroy
>>>>>>> b809b5155802fe7dd6d432439503b819db3ad268
  validates :name, presence: true

end
