class Passwords < ActiveRecord::Migration[5.0]
  def change
  	t.string "password"
  end
end
