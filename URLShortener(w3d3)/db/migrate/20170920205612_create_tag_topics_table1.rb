class CreateTagTopicsTable1 < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_topics do |t|
      t.string :topic, null: false

      t.timestamps
    end
  end
end
