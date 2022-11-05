require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "Joaquin", email: "joaquinberon2000@gmail.com",
                              password: "password", admin: true)
    sign_in @admin_user
    Category.create(name: "Sports")
    Category.create(name: "Music")
    Category.create(name: "Ninjas")
  end

  test "create article with categories" do
    get new_article_path
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "Testing", description: "This fucking shit", category_ids: [1, 2, 3] }}
      assert_response :redirect
    end
    follow_redirect!
    assert Article.last.categories.count == 3
  end
end
