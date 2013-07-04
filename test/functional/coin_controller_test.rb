require 'test_helper'

class CoinControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get flip" do
    get :flip
    assert_response :success
  end

end
