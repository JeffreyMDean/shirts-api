require "test_helper"

class ShirtsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/shirts.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Shirt.count, data.length
  end
  
end
