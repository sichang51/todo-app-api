require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/todos.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Todo.count, data.length
  end

  test "create" do
    assert_difference "Todo.count", 1 do
      post "/todos.json", params: { title: "test title", description: "test description", deadline: "02/15/2024", completed: "completed", category_id: Category.first.id }
      assert_response 200
    end
  end

  test "show" do
    get "/todos/#{Todo.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "description", "deadline", "completed", "created_at", "updated_at"], data.keys
  end

  test "update" do
    todo = Todo.first
    patch "/todos/#{todo.id}.json", params: { title: "Updated Title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Title", data["title"]
  end

  test "destroy" do
    assert_difference "Todo.count", -1 do
      delete "/todos/#{Todo.first.id}.json"
      assert_response 200
    end
  end
end
