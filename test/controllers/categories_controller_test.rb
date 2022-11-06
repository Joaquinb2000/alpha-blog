require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "Joaquin", email: "joaquinberon2000@gmail.com", password: "password", admin: true)
    @category = Category.create(name: "Sports")
    sign_in @admin_user
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: "Travel" } }
    end
    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    @admin_user.toggle!(:admin)
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: "Travel" } }
    end
    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_path(@category), params: { category: { name: "Tuti" } }
    assert_redirected_to category_path(@category)
    follow_redirect!
    assert_match "Tuti", response.body
  end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
