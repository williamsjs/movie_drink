require 'test_helper'

class BeersControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should destroy beer" do
    assert_difference('Beer.count', -1) do
      delete :destroy, id: beers(:one)
    end
  end

end
