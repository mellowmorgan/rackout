require "test_helper"

class UserTest < ActiveSupport::TestCase

  fake_email = "test@test.test"
  user_name = "test_user"
  # test "the truth" do
  #   assert true
  # end



  test "user create fails if no password" do
    user = User.new(email: fake_email, username: user_name)
    assert_not user.save
  end

  test "user create fails if no username" do
    user = User.new(email: fake_email, password: "test123")
    assert_not user.valid?
  end

  test "user create fails if password invalid" do
    user = User.new(email: fake_email, username: user_name, password:"test1")
    assert_not user.save
  end

  test "user create succeeds if password valid" do
    user = User.new(email: fake_email, username: user_name, password:"test123")
    assert user.save
  end

  test "user create fails if email duplicate" do
    user1 = User.new(email: fake_email, username: user_name, password:"test123")
    user1.save
    user2 = User.new(email: fake_email, username: user_name, password:"test123")
    assert_not user2.save
  end
end
