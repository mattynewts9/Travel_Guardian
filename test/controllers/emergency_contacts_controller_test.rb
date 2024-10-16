require "test_helper"

class EmergencyContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emergency_contacts_index_url
    assert_response :success
  end
end
