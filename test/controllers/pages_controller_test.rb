require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get careers" do
    get :careers
    assert_response :success
  end

  test "should get legalinfo" do
    get :legalinfo
    assert_response :success
  end

  test "should get aimesays" do
    get :aimesays
    assert_response :success
  end

end
