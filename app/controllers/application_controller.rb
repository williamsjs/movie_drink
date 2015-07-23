class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_movie_and_beer

  def set_movie_and_beer
    @movie = Movie.new
    @user = User.find(session[:user_id]) if session[:user_id]
  end

end
