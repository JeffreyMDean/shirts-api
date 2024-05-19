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

  test "update" do
    shirt = Shirt.first
    patch "/shirts/#{shirt.id}.json", params: { style: "Updated style", color: "Updated color", size: "Updated Size" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated style", data["style"]
    assert_equal "Updated color", data["color"]
    assert_equal "Updated size", data["size"]
  end
end
