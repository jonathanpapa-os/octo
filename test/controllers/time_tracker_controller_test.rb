require "test_helper"

class TimeTrackerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get time_tracker_index_url
    assert_response :success
  end
end
