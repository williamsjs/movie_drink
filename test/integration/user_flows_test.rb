require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

  test "login to site" do
    get sessions_login_path
    assert_select "input[type='password']", 2 # 1 for create modal and 1 for login
    post sessions_login_path, password: "password", email: "test@test.com"
    assert_response :success
  end

  
end
