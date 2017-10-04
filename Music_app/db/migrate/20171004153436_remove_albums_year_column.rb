class RemoveAlbumsYearColumn < ActiveRecord::Migration[5.1]
  def change
      remove_column :albums, :yaer
      add_column :albums, :year, :integer, null: false
  end
end
