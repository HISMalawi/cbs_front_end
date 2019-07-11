require 'test_helper'

class MyAccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_account_index_url
    assert_response :success
  end

end
