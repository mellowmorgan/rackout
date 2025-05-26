require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(username: "test", email: "test12@test.test", password: "test124")
    @event = Event.create!(user: @user, title: "Penthouse night shift", description:"Friday night shift", location: "Penthouse Nola", start_time: Time.now, end_time: Time.now+8.hours, is_work:true)
  end

  # test "visiting the index" do

  #   visit events_url
  #   assert_selector "h1", text: "Events"
  # end

  test "should create event" do
    visit root_url
    click_on "Log in"
    assert_text "Log in"
    assert_text "Email"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
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
