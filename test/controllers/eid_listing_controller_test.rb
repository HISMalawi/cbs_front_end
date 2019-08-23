require 'test_helper'

class EidListingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eid_listing_index_url
    assert_response :success
  end

  test "should get show" do
    get eid_listing_show_url
    assert_response :success
  end

end
