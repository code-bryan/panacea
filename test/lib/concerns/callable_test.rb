require "test_helper"

class CallableTest < ActiveSupport::TestCase
  class Dummy
    include Callable

    def initialize(message)
      @message = message
    end

    def call
      @message
    end
  end

  test "#Callable testing that callable injection works" do
    result = Dummy.call("Hello World")
    assert_equal "Hello World", result
  end
end
