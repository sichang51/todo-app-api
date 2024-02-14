require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/todos.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Todo.count, data.length
  end
end
