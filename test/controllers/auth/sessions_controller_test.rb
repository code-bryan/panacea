require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
  end

  test "GET new renders login form" do
    get auth_root_path
    assert_response :success
    assert_select "form"
  end

  test "POST create with valid credentials logs in user" do
    post auth_login_path, params: { auth_login_form: { email: @user.email, password: "password123" } }

    assert_redirected_to root_path
    assert_equal @user.id, session[:user_id]
    follow_redirect!
    # TODO: remember this section
    # assert_match /Logged in!/, response.body
  end

  test "POST create with invalid password re-renders form" do
    post auth_login_path, params: { auth_login_form: { email: @user.email, password: "wrongpass" } }

    assert_response :unprocessable_content
    assert_nil session[:user_id]
    assert_select "form"
    # assert_match /Invalid email or password/, response.body
  end

  test "POST create with invalid email re-renders form" do
    post auth_login_path, params: { auth_login_form: { email: "missing@example.com", password: "password123" } }

    assert_response :unprocessable_content
    assert_nil session[:user_id]
    assert_select "form"
    # assert_match /Invalid email or password/, response.body
  end

  test "DELETE destroy logs out user" do
    # Log in first
    post auth_login_path, params: { auth_login_form: { email: @user.email, password: "password123" } }
    assert_equal @user.id, session[:user_id]

    delete auth_logout_path
    assert_redirected_to auth_root_path
    assert_nil session[:user_id]
  end
end
