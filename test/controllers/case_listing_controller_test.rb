require 'test_helper'

class CaseListingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get case_listing_index_url
    assert_response :success
  end

end
