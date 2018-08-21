class DogRequest < ApplicationRecord
  belongs_to :dog
  has_many :requests
end
