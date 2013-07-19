require 'test_helper'

class ConsolidatorControllerTest < ActionController::TestCase
  test "should get companies" do
    get :companies
    assert_response :success
  end

end
