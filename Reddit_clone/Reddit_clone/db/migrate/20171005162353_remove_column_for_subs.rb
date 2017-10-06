class RemoveColumnForSubs < ActiveRecord::Migration[5.1]
  def change
    remove_column :subs, :name
  end
end
