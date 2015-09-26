require 'test_helper'
require './app/models/beer.rb'

class Beer

  private

    def search_beer(name)
      JSON.parse(File.open("./test/beer.json").read)
    end

end

class BeerTest < ActiveSupport::TestCase

  test "brewery is provided" do
    skip beer = Beer.create(movie: movies(:one))
    assert_equal "Coors Brewing Company", beer.get_brewery(search_beer("coors"), 0)
  end

end
