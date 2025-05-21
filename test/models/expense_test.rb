require "test_helper"

class ExpenseTest < ActiveSupport::TestCase
  test "should not create expense if no amount, title, category, or event_id attribute given" do
    user = User.create!(username:"testuser111",email:"testuser111@test.test", password:"test123")

    event = Event.new(title: "Night-shift and Penthouse", is_work:true,start_time: Time.now)

    expense = Expense.new(title: "stage fee", event: event, category:"club fees")
    assert_not expense.save

    expense = Expense.new(event: event, category:"club fees", amount: 50)
    assert_not expense.save

    expense = Expense.new(title: "stage fee", category:"club fees", amount: 50)
    assert_not expense.save

    expense = Expense.new(title: "stage fee", event: event, amount: 50)
    assert_not expense.save
  end

  test "should create expense successfully with valid attributes" do
    user = User.create!(username:"testuser111",email:"testuser111@test.test", password:"test123")

    event = Event.create!(title: "Night-shift and Penthouse", user: user, is_work:true,start_time: Time.now)

    expense = Expense.new(title: "stage fee", event: event, category:"club fees", amount: 50)
    assert expense.valid?
    assert expense.save
  end
end
