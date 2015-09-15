# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  character_id    :integer
#

class User < ActiveRecord::Base
  has_secure_password
  belongs_to :character
  has_many :movies
  has_many :beers, through: :movies

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :email, :password, :name, presence: true, on: :create

  def get_last_beer
    beers.last
  end

  def just_created?
    Time.now - movies.last.created_at < 3 unless movies == []
  end

  def return_map
    unless address == nil || address == ""
      address_arr = self.address.split(", ")
      city = address_arr.first.gsub(/\s/, "+")
      state = address_arr.last
      url = "https://www.google.com/maps/embed/v1/search?q=breweries+#{city}+#{state}&key=#{ENV['MAPS_KEY']}"
    end
  end

end
