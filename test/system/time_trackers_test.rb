require "application_system_test_case"

class TimeTrackersTest < ApplicationSystemTestCase
  setup do
    @time_tracker = time_trackers(:one)
  end

  test "visiting the index" do
    visit time_trackers_url
    assert_selector "h1", text: "Time Trackers"
  end

  test "creating a Time tracker" do
    visit time_trackers_url
    click_on "New Time Tracker"

    fill_in "Email", with: @time_tracker.email
    fill_in "Name", with: @time_tracker.name
    fill_in "Time end", with: @time_tracker.time_end
    fill_in "Time start", with: @time_tracker.time_start
    fill_in "Total time", with: @time_tracker.total_time
    click_on "Create Time tracker"

    assert_text "Time tracker was successfully created"
    click_on "Back"
  end

  test "updating a Time tracker" do
    visit time_trackers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @time_tracker.email
    fill_in "Name", with: @time_tracker.name
    fill_in "Time end", with: @time_tracker.time_end
    fill_in "Time start", with: @time_tracker.time_start
    fill_in "Total time", with: @time_tracker.total_time
    click_on "Update Time tracker"

    assert_text "Time tracker was successfully updated"
    click_on "Back"
  end

  test "destroying a Time tracker" do
    visit time_trackers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time tracker was successfully destroyed"
  end
end
