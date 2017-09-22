class CreatePoll < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.text :title, null: false
      t.integer :user_id, null: false
      t.integer :question_id
      t.timestamps
    end
    add_index(:polls, :user_id)
    add_index(:polls, :question_id)
  end
end
