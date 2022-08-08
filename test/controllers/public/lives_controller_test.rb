require "test_helper"

class Public::LivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_lives_index_url
    assert_response :success
  end

  test "should get show" do
    get public_lives_show_url
    assert_response :success
  end

  test "should get new" do
    get public_lives_new_url
    assert_response :success
  end
end
