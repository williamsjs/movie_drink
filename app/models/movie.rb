class Movie < ActiveRecord::Base
  belongs_to :user
  validates :year, presence: true

  def get_rating
    get_movie(name)['results'][0]['vote_average'] unless get_movie(name)['results'] == []
  end

  def get_year
    if get_movie(name)['results'] != []
      date = get_movie(name)['results'][0]['release_date']
      date[0..3]
    end
  end

  private

    def get_movie(name)
      HTTParty.get("https://api.themoviedb.org/3/search/movie?query=#{name}&api_key=#{ENV['MOVIE_KEY']}")
    end

end
