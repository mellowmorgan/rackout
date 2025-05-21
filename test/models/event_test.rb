require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "should not create event without user, title, is_work, state_time" do
      user = User.create!(username:"testuser1",email:"testuser3@test.test", password:"test123")
      event1 = Event.new(title: "Night-shift and Penthouse", is_work:true,start_time: Time.now)
      assert_not event1.valid?
      assert_not event1.save

      event2 = Event.new(title: "Night-shift and Penthouse", start_time: Time.now, user:user)
      assert_not event2.valid?
      assert_not event2.save

      event3 = Event.new(title: "Night-shift and Penthouse", is_work:true,user:user)
      assert_not event3.valid?
      assert_not event3.save

      event4 = Event.new(start_time: Time.now, is_work:true,user:user)
      assert_not event4.valid?
      assert_not event4.save
  end
  test "should create event with valid present attributes" do
    user = User.create!(username:"testuser1",email:"testuser3@test.test", password:"test123")
    event = Event.new(title: "Night-shift and Penthouse", user:user, is_work:true,start_time: Time.now)
    
    assert event.save
  end
end