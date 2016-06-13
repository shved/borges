class AddPositionToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :position, :int, null: false, default: 0
    add_index :games, :position
  end
end
