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

end
