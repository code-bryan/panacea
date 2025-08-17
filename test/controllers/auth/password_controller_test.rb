require "test_helper"

class PasswordControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
  end

  test "GET new renders forgot password form" do
    get auth_forgot_password_path
    assert_response :success
    assert_select "form"
  end

  test "POST create with valid credentials send reset password mail" do
    post auth_forgot_password_path, params: { auth_forgot_password_form: { email: @user.email } }

    # TODO: add mail testing

    assert_redirected_to auth_reset_password_path
  end
end
