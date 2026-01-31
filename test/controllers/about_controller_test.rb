require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get about_show_url
    assert_response :success
  end

  test "should get edit" do
    get about_edit_url
    assert_response :success
  end

  test "should get update" do
    get about_update_url
    assert_response :success
  end

  test "should get destroy" do
    get about_destroy_url
    assert_response :success
  end
end
