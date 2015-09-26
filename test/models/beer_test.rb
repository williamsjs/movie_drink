require 'test_helper'
require './app/models/beer.rb'

class Beer

  def add_details
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
    count = get_count(beer)
    name = get_name(beer, 1)
    description = get_description(beer, 1)
    abv = get_abv(beer, 1)
    location = get_location(beer, 1)
    url_image = get_image(beer, 1)
    update(abv: abv, description: description, name: name, url_image: url_image, location: location)
  end

  private

    def get_beer(name)
      JSON.parse(File.open("./test/beer.json").read)
    end

end

class BeerTest < ActiveSupport::TestCase

  test "brewery is provided" do
    beer = Beer.create()
    assert_equal "Coors Brewing Company", beer.get_brewery
  end

end
