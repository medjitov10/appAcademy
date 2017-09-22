class CreateResponse < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :answer_choices_id
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index(:responses, :answer_choices_id)
    add_index(:responses, :user_id)
  end
end
