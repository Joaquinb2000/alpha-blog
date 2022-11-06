require 'test_helper'

class UserSigninTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "Joaquin", email: "joaquinberon2000@gmail.com", password: "password")
  end

  test "user_login" do
    get login_path
    assert_response :success
    sign_in @user
    assert_response :redirect
    follow_redirect!
    assert_response :success
    get new_article_path
    assert_response :success
    assert_match "Joaquin", response.body
  end
end
