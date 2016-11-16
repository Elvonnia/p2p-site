class TableRooms < ActiveRecord::Migration[5.0]
  def change
  	create_table :rooms
  	add_column :rooms, :name, :string
  	add_column :rooms, :users, :array
  end
end
