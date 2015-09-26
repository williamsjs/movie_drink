require 'test_helper'
require './app/models/beer.rb'

class Beer

  private

    def get_beer(name)
      JSON.parse(File.open("./test/beer.json").read)
    end

end

class BeerTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end
  
end
