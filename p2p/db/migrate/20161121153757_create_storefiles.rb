class CreateStorefiles < ActiveRecord::Migration[5.0]
  def change
    create_table :storefiles do |t|
	t.string "name", limit: 255
	t.string "chatroom-id"
	t.string "path"
	t.string "size", limit: 2048
    end
  end
end
