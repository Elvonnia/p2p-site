class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
	t.string "text", limit: 3000
	t.string "chatroom_id"
    end
  end
end
