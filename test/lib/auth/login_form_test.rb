require "test_helper"

class Auth::LoginFormTest < ActiveSupport::TestCase
  test "is invalid without email" do
    form = Auth::LoginForm.new(password: "secret123")
    assert_not form.valid?
    assert_includes form.errors[:email], "can't be blank"
  end

  test "is invalid with bad email format" do
    form = Auth::LoginForm.new(email: "invalid", password: "secret123")
    assert_not form.valid?
    assert_includes form.errors[:email], "is invalid"
  end

  test "is invalid with short password" do
    form = Auth::LoginForm.new(email: "user@example.com", password: "123")
    assert_not form.valid?
    assert_includes form.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "is valid with correct attributes" do
    form = Auth::LoginForm.new(email: "user@example.com", password: "secret123")
    assert form.valid?
  end

  test "remember_me defaults to false" do
    form = Auth::LoginForm.new(email: "user@example.com", password: "secret123")
    assert_equal false, form.remember_me
  end
end
