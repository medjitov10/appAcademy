class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :yaer, null: false
      t.integer :band_id, null: false
      t.boolean :live?, default: true
    end
  end
end
