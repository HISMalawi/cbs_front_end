require 'test_helper'

class ArtInitiationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get art_initiation_index_url
    assert_response :success
  end

end
