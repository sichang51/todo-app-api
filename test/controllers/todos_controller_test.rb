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
      post "/todos.json", params: { title: "test title", description: "test description", deadline: "02/15/2024", completed: "completed" }
      assert_response 200
    end
  end

  test "show" do
    get "/todos/#{Todo.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "description", "deadline", "completed", "created_at", "updated_at"], data.keys
  end
end
