class User < ActiveRecord::Base
  has_secure_password
  has_many :movies
  has_many :beers, through: :movies

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end
