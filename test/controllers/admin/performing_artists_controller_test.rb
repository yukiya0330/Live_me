require "test_helper"

class Admin::PerformingArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_performing_artists_new_url
    assert_response :success
  end
end
