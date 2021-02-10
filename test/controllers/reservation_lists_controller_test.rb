require 'test_helper'

class ReservationListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservation_lists_index_url
    assert_response :success
  end

end
