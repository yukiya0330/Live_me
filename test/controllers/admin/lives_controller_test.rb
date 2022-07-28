require "test_helper"

class Admin::LivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_lives_index_url
    assert_response :success
  end

  test "should get shoe" do
    get admin_lives_shoe_url
    assert_response :success
  end

  test "should get new" do
    get admin_lives_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_lives_edit_url
    assert_response :success
  end
end
