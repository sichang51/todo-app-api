class RemoveCategoryIdFromTodos < ActiveRecord::Migration[7.0]
  def change
    remove_column :todos, :category_id, :integer
  end
end
