require "test_helper"

class ResultTest < ActiveSupport::TestCase
  test "Should return success truthy if has data" do
    result = Result.new(data: "Test", error: nil)
    assert_equal result.success?, true
    assert_equal result.data, "Test"
  end

  test "Should return success falsy if there is an error" do
    result = Result.new(data: nil, error: "Is an error")
    assert_equal result.success?, false
    assert_equal result.error, "Is an error"
  end
end
