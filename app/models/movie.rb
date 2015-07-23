class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :beers
  validates :year, presence: true
  after_create :create_beer

  def beer
    beers.first.id unless beers.empty?
  end

  def movie_json
    get_movie(name.gsub(" ", "%20"))
  end

  def redo(user)
    movie = movie_json
    update(name: get_name(movie), rating: get_rating(movie), year: get_year(movie), poster: get_poster(movie), user: user) unless movie['results'].nil?
  end

  def get_name(movie)
    movie['results'][0]['original_title']
  end

  def get_rating(movie)
    movie['results'][0]['vote_average']
  end

  def get_year(movie)
    date = movie['results'][0]['release_date']
    date[0..3]
  end

  def get_poster(movie)
    poster_path = movie['results'][0]['poster_path']
    "http://image.tmdb.org/t/p/w500/#{poster_path}" if !poster_path.nil?
  end

  def create_beer
    Beer.create(movie_id: id, user: user)
  end

  private

    def get_movie(name)
      HTTParty.get("https://api.themoviedb.org/3/search/movie?query=#{name}&api_key=#{ENV['MOVIE_KEY']}")
    end

end
