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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
