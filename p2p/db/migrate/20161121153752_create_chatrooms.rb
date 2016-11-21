class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
	t.string "name", limit: 255
	t.string "password"
    end
  end
end
