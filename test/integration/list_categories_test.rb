require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category_2 = Category.create(name: "Travel")
    @category_3 = Category.create(name: "Anime")
    @category_4 = Category.create(name: "Movies")
    @category_5 = Category.create(name: "Books")
    @category_6 = Category.create(name: "Stuff")
  end

  test "get categories listing" do
    get categories_path
    assert_select "a[href=?]", category_path(@category), text: @category.name.capitalize
    assert_select "a[href=?]", category_path(@category_2), text: @category_2.name.capitalize
    assert_select "div.pagination", count: 2
  end
end
