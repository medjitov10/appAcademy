class AddColunmForSubs < ActiveRecord::Migration[5.1]
  def change
    add_column :subs, :title, :string


  end
end
