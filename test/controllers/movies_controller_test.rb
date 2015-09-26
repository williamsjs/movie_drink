require 'test_helper'


class MoviesControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    session[:user_id] = @user.id
    @guide = characters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
