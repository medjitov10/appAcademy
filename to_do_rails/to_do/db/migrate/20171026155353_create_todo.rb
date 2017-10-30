class CreateTodo < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :done, null: false
    end
  end
end
