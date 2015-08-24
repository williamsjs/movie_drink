require 'rails_helper'
require './app/models/movie.rb'

class Movie
  private
    def get_movie(name)
      JSON.parse(File.open("./test/movie.json").read)
    end
end

describe Movie do

  it "has a valid factory" do
    FactoryGirl.create(:movie)
  end

end
