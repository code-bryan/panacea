require "test_helper"

class Auth::ForgotPasswordTest < ActiveSupport::TestCase
  test "is invalid without email" do
    form = Auth::ForgotPasswordForm.new
    assert_not form.valid?
    assert_includes form.errors[:email], "can't be blank"
  end

  test "is invalid with bad email format" do
    form = Auth::ForgotPasswordForm.new(email: "Invalid")
    assert_not form.valid?
    assert_includes form.errors[:email], "is invalid"
  end

  test "is valid with correct attributes" do
    form = Auth::ForgotPasswordForm.new(email: "user@example.com")
    assert form.valid?
  end
end
