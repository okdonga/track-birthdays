class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :presents
  has_many :interests
  has_many :likes
end
