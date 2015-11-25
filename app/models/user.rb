class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :friends
  # has_many :presentsx :through :friends
end
