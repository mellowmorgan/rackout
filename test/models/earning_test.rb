require "test_helper"

class EarningTest < ActiveSupport::TestCase
  test "should not create earning if no amount, title, category, or event_id attribute given" do
    user = User.create!(username:"testuser999",email:"testuser999@test.test", password:"test123")

    event = Event.new(title: "Night-shift and Penthouse", is_work:true,start_time: Time.now)

    earning = Earning.new(title: "income", event: event, category:"miscellaneous")
    assert_not earning.save

    earning = Earning.new(event: event, category:"miscellaneous", amount: 590.50)
    assert_not earning.save

    earning = Earning.new(title: "income", category:"miscellaneous", amount: 590.50)
    assert_not earning.save

    earning = Earning.new(title: "income", event: event, amount: 590.50)
    assert_not earning.save
  end

  test "should create earning successfully with valid attributes" do
    user = User.create!(username:"testuser6",email:"testuser6@test.test", password:"test123")

    event = Event.create!(title: "Night-shift and Penthouse", user: user, is_work:true,start_time: Time.now)

    earning = Earning.new(title: "income", event: event, category:"miscellaneous", amount: 585)
    assert earning.valid?
    assert earning.save
  end
end
