require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/categories.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Category.count, data.length
  end

  test "create" do
    assert_difference "Category.count", 1 do
      post "/categories.json", params: { name: "test" }
      assert_response 200
    end
  end

  test "show" do
    get "/categories/#{Category.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "created_at", "updated_at"], data.keys
  end

  test "update" do
    category = Category.first
    patch "/categories/#{category.id}.json", params: { name: "Updated Name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Name", data["name"]
  end

  test "destroy" do
    assert_difference "Category.count", -1 do
      delete "/categories/#{Category.first.id}.json"
      assert_response 200
    end
  end
end
