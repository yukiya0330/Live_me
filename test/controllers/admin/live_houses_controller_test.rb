require "test_helper"

class Admin::LiveHousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_live_houses_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_live_houses_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_live_houses_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_live_houses_new_url
    assert_response :success
  end
end
