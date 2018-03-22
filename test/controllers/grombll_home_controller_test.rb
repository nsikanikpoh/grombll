require 'test_helper'

class GrombllHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get grombll_home" do
    get grombll_home_grombll_home_url
    assert_response :success
  end

end
