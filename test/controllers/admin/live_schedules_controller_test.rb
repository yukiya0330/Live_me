require "test_helper"

class Admin::LiveSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_live_schedules_new_url
    assert_response :success
  end
end
