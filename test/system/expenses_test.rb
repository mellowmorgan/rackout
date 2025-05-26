# require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @event = events(:one)
    @expense = expenses(:one)
  end

  test "should create expense" do
    visit user_event_url(@user, @event)
    click_on "Add Expense"
    fill_in "Title", with: @expense.title
    fill_in "Amount", with: @expense.amount
    fill_in "Description", with: @expense.description
    find('#expense_category option', :text => @expense.category).click

    click_on "Create Expense"

    assert_text "Expense was successfully created"
  end

#   test "should update Expense" do
#     visit expense_url(@expense)
#     click_on "Edit this expense", match: :first

#     fill_in "Amount", with: @expense.amount
#     fill_in "Category", with: @expense.category
#     fill_in "Description", with: @expense.description
#     fill_in "Title", with: @expense.title
#     click_on "Update Expense"

#     assert_text "Expense was successfully updated"
#     click_on "Back"
#   end

#   test "should destroy Expense" do
#     visit expense_url(@expense)
#     click_on "Destroy this expense", match: :first

#     assert_text "Expense was successfully destroyed"
#   end
end
