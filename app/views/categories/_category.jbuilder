json.id category.id
json.name category.name
json.created_at category.created_at
json.updated_at category.updated_at

json.todos category.todos.map do |todo|
  json.title todo.title
  json.description todo.description
  json.deadline todo.deadline
  json.completed todo.completed
  json.id todo.id
  json.category_id category.id
end
