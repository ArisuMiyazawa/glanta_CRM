require 'test_helper'

class GuestReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get guest_reservations_new_url
    assert_response :success
  end

end
