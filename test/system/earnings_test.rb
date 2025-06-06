require "application_system_test_case"

class EarningsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @event = events(:one)
    @earning = earnings(:one)
  end

  test "should create earning" do
    visit user_event_url(@user, @event)
    click_on "Add Earning"

    fill_in "Amount", with: @earning.amount
    find('#earning_category option', :text => @earning.category).click
    fill_in "Description", with: @earning.description
    fill_in "Title", with: @earning.title
    click_on "Create Earning"

    assert_text "Earning was successfully created"
  end

  test "should update Earning" do
    visit user_event_earning_url(@user, @event, @earning)
    click_on "Edit this earning", match: :first

    fill_in "Amount", with: @earning.amount
    find('#earning_category option', :text => @earning.category).click
    fill_in "Description", with: @earning.description
    fill_in "Title", with: @earning.title
    click_on "Update Earning"

    assert_text "Earning was successfully updated"
  end

  test "should destroy Earning" do
    visit user_event_earning_url(@user, @event, @earning)
    click_on "Destroy this earning", match: :first

    assert_text "Earning was successfully destroyed"
  end
end
