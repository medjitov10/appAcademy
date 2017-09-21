class CreateTaggingsTable2 < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.integer :topic_id, null: false
      t.integer :shortened_url_id, null:false

    end

    add_index :taggings, :topic_id
    add_index :taggings, :shortened_url_id
  end
end
