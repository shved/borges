class ChangeIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :likes, [:author_id, :game_session_id]
  end
end
