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

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: movies(:one)
    end
  end

end
