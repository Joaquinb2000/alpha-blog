require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
      @category = Category.new(name: "Sports")
  end

    test "category should be valid" do
      assert @category.valid?
    end

    test "name should be present" do
      @category.name = " "
      assert_not @category.valid?
    end

    test "name should be unique" do
      @category_copy = Category.new(name: "sports")
      @category.save
      assert_not @category_copy.valid?
    end

    test "name should not be too long" do
      @category.name = "*"*27
      assert_not @category.valid?
    end

    test "name should not be too short" do
      @category.name = "na"
      assert_not @category.valid?
    end
end
