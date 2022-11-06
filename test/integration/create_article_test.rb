require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "Joaquin", email: "joaquinberon2000@gmail.com", password: "password")
  end

  test "create_new_article" do
    sign_in @user
    get new_article_path
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "Test input", description: 'Test input my man'}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    get articles_path
    assert_select 'div.article-card'
    assert_match 'Test input', response.body
  end
end
