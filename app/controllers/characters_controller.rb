class CharactersController < ApplicationController
  before_action :set_user
  before_action :set_character, only: [:establish_character]

  def index
    @characters = Character.all
  end

  def establish_character
    @user.update_without_password(@character)
    redirect_to movies_path
  end

  private

    def set_user
      @user = User.find(session[:user_id])
    end

    def set_character
      @character = Character.find(params[:id])
    end

end
