class Beer < ActiveRecord::Base
  belongs_to :user

  def get_brewery

  end

  def get_style

  end

  def get_description

  end

  def get_abv

  end

  def get_location

  end

  private

    def search_beer
      HTTParty.get("https://api.untappd.com/v4/search/beer?q=#{name}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}")
    end

end
