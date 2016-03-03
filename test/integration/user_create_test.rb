require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest
  test "create a user" do
  	get '/users'
  	assert_response :success

  	get '/users/new'
  	assert_response :success

    assert_difference('User.count') do
      post_via_redirect '/users', user: { name: "Alvaro Escobar", email: "alvaro@example.com", code_school_id: code_schools(:one).id }
    end

    assert_match /\/users\/\d+/, path
    assert_equal 'User was successfully created.', flash[:notice]

    assert_select 'dl', 1, "Should have a dl tag for the user"
    assert_select 'dd', 3, "Should have 3 dd tags. Name, email, code_school"

  end
end
