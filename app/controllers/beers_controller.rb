class BeersController < ApplicationController
  before_action :set_beer, only: [:destroy]

  def index
    @beers = User.find(session[:user_id]).beers
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

end
