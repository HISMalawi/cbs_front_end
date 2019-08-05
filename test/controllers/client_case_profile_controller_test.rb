require 'test_helper'

class ClientCaseProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_case_profile_index_url
    assert_response :success
  end

  test "should get show" do
    get client_case_profile_show_url
    assert_response :success
  end

end
