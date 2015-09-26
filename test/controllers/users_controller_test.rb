require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "cool@coolio.com", name: "Cookio", password: "password" }
    end

    assert_redirected_to characters_index_path
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
