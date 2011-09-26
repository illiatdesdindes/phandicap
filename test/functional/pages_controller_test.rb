require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get notadmin" do
    get :notadmin
    assert_response :success
  end

end
