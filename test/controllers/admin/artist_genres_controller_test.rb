require "test_helper"

class Admin::ArtistGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_artist_genres_new_url
    assert_response :success
  end
end
