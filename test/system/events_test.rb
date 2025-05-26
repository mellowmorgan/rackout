require "application_system_test_case"
require "test_helper"

class EventsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @event = events(:one)
    @password = '125greetings'
  end

  test "should create event" do
    visit root_url
    click_on "Log in"
    assert_text "Log in"
    assert_text "Email"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @password
    click_button 'Log in'
    assert_text "Signed in successfully."
    click_on "Add Event"

    fill_in "Description", with: @event.description
    fill_in "End time", with: @event.end_time
    check "Is work" if @event.is_work
    fill_in "Location", with: @event.location
    fill_in "Start time", with: @event.start_time
    fill_in "Title", with: @event.title
    click_on "Create Event"

    assert_text "Event was successfully created"
  end

  test "should update Event" do
    visit user_event_url(@user, @event)
    click_on "Edit this event", match: :first

    fill_in "Description", with: @event.description
    fill_in "End time", with: @event.end_time.to_s
    check "Is work" if @event.is_work
    fill_in "Location", with: @event.location
    fill_in "Start time", with: @event.start_time.to_s
    fill_in "Title", with: @event.title
    click_on "Update Event"

    assert_text "Event was successfully updated"
  end

  test "should destroy Event" do
    visit user_event_url(@user, @event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
