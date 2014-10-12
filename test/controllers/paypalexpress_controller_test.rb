require 'test_helper'

class PaypalexpressControllerTest < ActionController::TestCase
  test "should get review" do
    get :review
    assert_response :success
  end

end
