require 'rails_helper'

describe Beer do

  it "creates a beer with the creation of a movie" do
    expect{Movie.create(name: "Jaws")}.to change{Beer.count}.by(1)
  end

end
