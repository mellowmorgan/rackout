require "application_system_test_case"

class EarningsTest < ApplicationSystemTestCase
  setup do
    @earning = earnings(:one)
  end

  test "visiting the index" do
    visit earnings_url
    assert_selector "h1", text: "Earnings"
  end

  test "should create earning" do
    visit earnings_url
    click_on "New earning"

    fill_in "Amount", with: @earning.amount
    fill_in "Category", with: @earning.category
    fill_in "Description", with: @earning.description
    fill_in "Title", with: @earning.title
    click_on "Create Earning"

    assert_text "Earning was successfully created"
    click_on "Back"
  end

  test "should update Earning" do
    visit earning_url(@earning)
    click_on "Edit this earning", match: :first

    fill_in "Amount", with: @earning.amount
    fill_in "Category", with: @earning.category
    fill_in "Description", with: @earning.description
    fill_in "Title", with: @earning.title
    click_on "Update Earning"

    assert_text "Earning was successfully updated"
    click_on "Back"
  end

  test "should destroy Earning" do
    visit earning_url(@earning)
    click_on "Destroy this earning", match: :first

    assert_text "Earning was successfully destroyed"
  end
end
