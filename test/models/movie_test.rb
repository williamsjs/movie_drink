require 'test_helper'
require './app/models/movie.rb'
require './app/models/beer.rb'

class Movie

  private

    def get_movie(name)
      JSON.parse(File.open("./test/movie.json").read)
    end

end

class Beer

  private

    def search_beer(name)
      JSON.parse(File.open("./test/beer.json").read)
    end

end

class MovieTest < ActiveSupport::TestCase

  test "movie gets name from api" do
    star_trek = Movie.create(name: "star trek")
    star_trek.redo(users(:one))
    assert_equal "Star Trek", star_trek.name
  end

  test "movie gets rating from api" do
    star_trek = Movie.create(name: "star trek")
    star_trek.redo(users(:one))
    assert_equal 7.3, star_trek.rating
  end

  test "movie gets year from api" do
    star_trek = Movie.create(name: "star trek")
    star_trek.redo(users(:one))
    assert_equal 2009, star_trek.year
  end

  test "movie gets assigned user" do
    star_trek = Movie.create(name: "star trek")
    star_trek.redo(users(:one))
    assert_equal users(:one), star_trek.user
  end

  test "movie creates beer on create" do
    skip
  end

end
