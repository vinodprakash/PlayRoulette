require 'test_helper'

class Api::V1::CasinosControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
