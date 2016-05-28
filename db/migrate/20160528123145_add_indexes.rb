class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :result_likes, [:author_id, :game_result_id]
    add_index :game_results, [:author_id, :game_id]
    add_index :authors, [:login, :email]
  end
end
