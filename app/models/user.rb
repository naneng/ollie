class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include PgSearch
  pg_search_scope :global_search,
    against: [ :name, :location ],
  using: {
    tsearch: { prefix: true}
  }

  has_many :dogs
  has_many :requests
  has_many :bookings
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  scope :organizations, -> {where(organization: true)}
  scope :individuals, -> {where(organization: false)}

end
