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

  include PgSearch
  pg_search_scope :global_search,
    against: [ :status, :time, :pickup_location, :dropoff_location ],
  associated_against: {
    user: [ :name ],
    dogs: [ :name ]
  },
  using: {
    tsearch: { prefix: true }
  }


  def dog_list
    dogs.map {|dog| dog.name }.join(', ')
  end
end
