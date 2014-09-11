require 'test_helper'

class NumbersControllerTest < ActionController::TestCase
  test "should get pick" do
    get :pick
    assert_response :success
  end

  test "should get guess" do
    get :guess
    assert_response :success
  end

  test "should get match" do
    get :match
    assert_response :success
  end

end
