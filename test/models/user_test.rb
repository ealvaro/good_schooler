require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
  	say_hello
    assert true
  end

  def test_the_false
  	say_hello
    assert !false, "The false is not true"
  end

  test "user email never has nil" do
  	u = User.new
  	u.email = nil
  	assert_not u.save, "User emails should never be nil"
  end
end
