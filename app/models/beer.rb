class Beer < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  after_create :determine_beer

  def determine_beer
    beer = nil
    if movie.rating < 5
      beer = search_beer(bad_beers)
    elsif movie.rating >= 7
      beer = search_beer(great_beers)
    elsif movie.rating >= 6
      beer = search_beer(good_beers)
    elsif movie.rating >= 5
      beer = search_beer(mediocre_beers)
    end
    get_beer_variables(beer)
  end

  def get_beer_variables(beer)
    count = get_count(beer)
    random = rand(count)
    name = get_name(beer, random)
    update_beer(get_abv(beer, random), get_description(beer, random), get_name(beer, random), get_image(beer, random), get_location(beer, random))
  end

  def update_beer(abv, description, name, url_image, location)
    update(abv: abv, description: description, name: name, url_image: url_image, location: location)
  end

  def get_brewery(beer, random)
    beer["response"]["beers"]["items"][random]["brewery"]
  end

  def get_image(beer, random)
    beer["response"]["beers"]["items"][random]["brewery"]["brewery_label"]
  end

  def get_style(beer, random)
    beer["response"]["beers"]["items"][random]["beer"]["beer_style"]
  end

  def get_name(beer, random)
    beer["response"]["beers"]["items"][random]["beer"]["beer_name"]
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
    city = beer["response"]["beers"]["items"][random]["brewery"]["location"]["brewery_city"]
    state = beer["response"]["beers"]["items"][random]["brewery"]["location"]["brewery_state"]
    "#{city}, #{state}"
  end


  private

    def search_beer(name)
      HTTParty.get("https://api.untappd.com/v4/search/beer?q=#{name}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}")
    end

    def bad_beers
      beers = ["bud", "natural", "coors"]
      beers[rand(beers.length)].gsub(" ", "%20")
    end

    def mediocre_beers
      beers = ["samuel adams", "blue moon", "newcastle"]
      beers[rand(beers.length)].gsub(" ", "%20")
    end

    def good_beers
      beers = ["guiness"]
      beers[rand(beers.length)].gsub(" ", "%20")
    end

    def great_beers
      beers = ["sierra nevada", "stone"]
      beers[rand(beers.length)].gsub(" ", "%20")
    end

end
