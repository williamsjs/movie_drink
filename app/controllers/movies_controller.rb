class MoviesController < ApplicationController
  before_action :logged_in?
  before_action :set_movie, only: [:show, :edit, :edit, :destroy, :update]
  before_action :set_user, only: [:index, :new, :create]

  def index
    @movies = @user.movies
    @guide = @user.character
  end

  def new
    @movie = Movie.new
  end

  def show
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.redo(@user)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path }
      else
        format.html { redirect_to movies_path, notice: "No movie of that name was found" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movies_path, notice: "Movie updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_path }
    end
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
      params.require(:movie).permit(:name)
    end

end
