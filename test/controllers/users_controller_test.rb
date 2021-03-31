require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_98)
    @code_school = code_schools(:one)
    @user.code_school = @code_school
  end
  teardown do
    @user = nil
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: @user.name, email: "alvaro@example.com" }
    end

    assert_redirected_to user_path(assigns(:user))
    # puts cookies
    # puts flash
    # puts session
  end

  test "should show user" do
    # puts @code_school.name
    # puts @user.inspect
    get :show, id: @user
    assert_response :success
    assert_not_nil @user.code_school
    assert_select 'dl', 1, "Should have a dl tag for the user"
    assert_select 'dd', 3, "Should have 3 dd tags. Name, email, code_school"
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { name: @user.name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
