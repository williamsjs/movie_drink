class BeersController < ApplicationController
  before_action :set_beer, only: [:destroy]
  before_action :set_user, only: [:index]

  def index
    @beers = @user.beers
  end

  def destroy
    @beer.destroy
    respond_to do |format|
      format.html {redirect_to beers_path, notice: "Beer deleted"}
    end
  end

  private

    def set_beer
      @beer = Beer.find(params[:id])
    end

    def set_user
      @user = User.find(session[:user_id])
    end

end
