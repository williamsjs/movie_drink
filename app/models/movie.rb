class Movie < ActiveRecord::Base
  belongs_to :user
  validates :name, :year, presence: true

  def get_rating(name)
    if Movie.find_by_name(name)
      self.rating
    else
      get_movie(name)['results'][0]['vote_average']
    end
  end

  def get_year(name)
    if Movie.find_by_name(name)
      self.year
    else
      date = get_movie(name)['results'][0]['release_date']
      date[0..3]
    end
  end

  private

    def get_movie(name)
      HTTParty.get("https://api.themoviedb.org/3/search/movie?query=#{name}&api_key=#{ENV['MOVIE_KEY']}")
    end

end
