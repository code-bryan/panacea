require "test_helper"
require "ostruct"

class Auth::LoginUseCaseTest < ActiveSupport::TestCase
  test "returns success result when email and password are correct" do
    user = User.create!(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      password: "password123",
      company: companies(:one) # Assuming you have a fixture or factory
    )

    form = OpenStruct.new(email: "john@example.com", password: "password123")
    result = Auth::LoginUseCase.call(form)

    assert result.success?
    assert_equal user, result.data
    assert_nil result.error
  end

  test "returns error when email does not exist" do
    form = OpenStruct.new(email: "missing@example.com", password: "password123")
    result = Auth::LoginUseCase.call(form)

    assert_not result.success?
    assert_nil result.data
    assert_equal "Invalid email or password", result.error
  end

  test "returns error when password is incorrect" do
    user = User.create!(
      first_name: "Jane",
      last_name: "Smith",
      email: "jane@example.com",
      password: "password123",
      company: companies(:one)
    )

    form = OpenStruct.new(email: "jane@example.com", password: "wrongpass")
    result = Auth::LoginUseCase.call(form)

    assert_not result.success?
    assert_nil result.data
    assert_equal "Invalid email or password", result.error
  end
end
