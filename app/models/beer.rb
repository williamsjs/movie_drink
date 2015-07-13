class Beer < ActiveRecord::Base
  belongs_to :movie
  after_create :add_details

  def add_details
    if movie.rating < 1
      beer = search_beer("bud")
      count = get_count(beer)
      random = rand(count)
      description = get_description(beer, random)
      abv = get_abv(beer, random)
      location = get_location(beer, random)
    end
    update(abv: abv, description: description)
  end

  def get_brewery(beer)
    beer["response"]["beers"]
  end

  def get_style(beer)

  end

  def get_description(beer, random)
    beer["response"]["beers"]["items"][random]["beer"]["beer_description"]
  end

  def get_abv(beer, random)
    beer["response"]["beers"]["items"][random]["beer"]["beer_abv"]
  end

  def get_count(beer)
    beer["response"]["beers"]["count"]
  end

  def get_location(beer, random)

  end

  private

    def search_beer(name)
      HTTParty.get("https://api.untappd.com/v4/search/beer?q=#{name}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}")
    end

end
