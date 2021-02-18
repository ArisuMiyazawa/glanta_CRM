require 'test_helper'

class TreatmentRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get treatment_records_new_url
    assert_response :success
  end

end
