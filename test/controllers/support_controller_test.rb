require "test_helper"

class SupportControllerTest < ActionDispatch::IntegrationTest
  test "GET should display the support page" do
    get support_index_url
    assert_response :success
  end

  test "POST should pass if has all params" do
    post support_index_url, params: { support_form: { name: "John Doe", email: "test@email.com", message: "Test" } }

    assert_redirected_to support_index_url
  end
end
