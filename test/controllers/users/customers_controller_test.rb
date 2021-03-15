require 'test_helper'

class Users::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_customers_index_url
    assert_response :success
  end

end
