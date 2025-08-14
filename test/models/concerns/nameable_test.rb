require "test_helper"

class NameableTest < ActiveSupport::TestCase
  class Dummy
    include Nameable
    attr_accessor :first_name, :last_name
  end

  def setup
    @user = Dummy.new
  end

  test "full_name combines first and last name" do
    @user.first_name = "John"
    @user.last_name = "Doe"
    assert_equal "John Doe", @user.full_name
  end

  test "full_name handles missing last name" do
    @user.first_name = "John"
    @user.last_name = nil
    assert_equal "John", @user.full_name
  end

  test "full_name handles missing first name" do
    @user.first_name = nil
    @user.last_name = "Doe"
    assert_equal "Doe", @user.full_name
  end

  test "full_name handles both names missing" do
    @user.first_name = nil
    @user.last_name = nil
    assert_equal "", @user.full_name
  end
end
