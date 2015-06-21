class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :actors
  validates :name, :year, presence: true

  accepts_nested_attributes_for :actors, reject_if: :all_blank

  def get_rating(name)
    get_movie(name)['results'][0]['vote_average']
  end

  def get_year(name)
    date = get_movie(name)['results'][0]['release_date']
    date[0..3]
  end

  private

    def get_movie(name)
      HTTParty.get("https://api.themoviedb.org/3/search/movie?query=#{name}&api_key=#{ENV['MOVIE_KEY']}")
    end

end
