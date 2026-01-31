require "test_helper"

class PropertyCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_category = property_categories(:one)
  end

  test "should get index" do
    get property_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_property_category_url
    assert_response :success
  end

  test "should create property_category" do
    assert_difference("PropertyCategory.count") do
      post property_categories_url, params: { property_category: { name: @property_category.name } }
    end

    assert_redirected_to property_category_url(PropertyCategory.last)
  end

  test "should show property_category" do
    get property_category_url(@property_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_category_url(@property_category)
    assert_response :success
  end

  test "should update property_category" do
    patch property_category_url(@property_category), params: { property_category: { name: @property_category.name } }
    assert_redirected_to property_category_url(@property_category)
  end

  test "should destroy property_category" do
    assert_difference("PropertyCategory.count", -1) do
      delete property_category_url(@property_category)
    end

    assert_redirected_to property_categories_url
  end
end
