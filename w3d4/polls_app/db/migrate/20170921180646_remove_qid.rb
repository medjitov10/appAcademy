class RemoveQid < ActiveRecord::Migration[5.1]
  def change
    remove_column :polls, :question_id
  end
end
