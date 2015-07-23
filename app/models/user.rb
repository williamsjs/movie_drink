class User < ActiveRecord::Base
  has_secure_password
  has_many :movies
  has_many :beers, through: :movies

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :email, :password, :name, presence: true

  def get_last_beer
    beers.last
  end

  def just_created?
    Time.now - movies.last.created_at < 3
  end

end
