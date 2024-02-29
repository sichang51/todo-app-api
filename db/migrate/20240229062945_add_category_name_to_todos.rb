class AddCategoryNameToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :category_name, :string
  end
end
