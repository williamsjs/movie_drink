class MoviesController < ApplicationController
  before_action :logged_in?

  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create]

  def index
    @movies = @user.movies
  end

  def new
    @movie = Movie.new
  end

  def show
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = @user.id
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
      end
    end
  end

  def destroy
    @movie.destroy
  end

  def update
  end

  private

    def logged_in?
      unless User.find_by_id(session[:user_id])
        redirect_to sessions_login_path, notice: "you must login"
      end
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def set_user
      @user = User.find_by_id(session[:user_id])
    end

    def movie_params
      params.require(:movie).permit(:name, :year, :director, :rating, :user_id)
    end

end
