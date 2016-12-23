require 'test_helper'

class RatesControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get rates_feed_url
    assert_response :success
  end

end
