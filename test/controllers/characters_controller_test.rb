require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  
  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
