class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :beers
  validates :year, presence: true
  after_create :create_beer

  def beer
    beers.first.id
  end

  def redo(user)
    update(name: get_name, rating: get_rating, year: get_year, poster: get_poster, user: user)
  end

  def get_name
    get_movie(name)['results'][0]['original_title'] unless get_movie(name)['results'] == []
  end

  def get_rating
    get_movie(name)['results'][0]['vote_average'] unless get_movie(name)['results'] == []
  end

  def get_year
    if get_movie(name)['results'] != []
      date = get_movie(name)['results'][0]['release_date']
      date[0..3]
    end
  end

  def get_poster
    poster_path = get_movie(name)['results'][0]['poster_path'] unless get_movie(name)['results'] == []
    "http://image.tmdb.org/t/p/w500/#{poster_path}" unless get_movie(name['results']) == []
  end

  def create_beer
    Beer.create(movie_id: id, user: user)
  end

  private

    def get_movie(name)
      HTTParty.get("https://api.themoviedb.org/3/search/movie?query=#{name}&api_key=#{ENV['MOVIE_KEY']}")
    end

end
