require "test_helper"

class Public::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_genres_index_url
    assert_response :success
  end
end
