require "test_helper"

class SupportFormTest < ActiveSupport::TestCase
  test "is invalid without email" do
    form = SupportForm.new(name: "John Doe", message: "Test")
    assert_not form.valid?
    assert_includes form.errors[:email], "can't be blank"
  end

  test "is invalid with bad email format" do
    form = SupportForm.new(name: "John Doe", email: "invalid", message: "Test")
    assert_not form.valid?
    assert_includes form.errors[:email], "is invalid"
  end

  test "is invalid without name" do
    form = SupportForm.new(email: "test@email.com", message: "Test")
    assert_not form.valid?
    assert_includes form.errors[:name], "can't be blank"
  end

  test "is invalid without message" do
    form = SupportForm.new(email: "test@email.com", name: "John Doe")
    assert_not form.valid?
    assert_includes form.errors[:message], "can't be blank"
  end

  test "is valid with correct attributes" do
    form = SupportForm.new(name: "John Doe", email: "test@email.com", message: "Test")
    assert form.valid?
  end
end
