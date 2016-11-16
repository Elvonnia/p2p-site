require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create_room" do
    get pages_create_room_url
    assert_response :success
  end

end
