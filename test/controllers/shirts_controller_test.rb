require "test_helper"

class ShirtsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/shirts.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Shirt.count, data.length
  end
  
  test "create" do
    assert_difference "Shirt.count", 1 do
      post "/shirts.json", params: { stlye: "polo", color: "blue", size: "large" }
      assert_response 200
    end
  end

  test "show" do
    get "/shirts/#{Shirt.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["style", "color", "size", "created_at", "updated_at"], data.keys
  end
end
