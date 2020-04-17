require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get hello_top_url
    assert_response :success
  end

end
