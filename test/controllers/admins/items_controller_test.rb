require 'test_helper'

class Admins::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_items_index_url
    assert_response :success
  end

end
