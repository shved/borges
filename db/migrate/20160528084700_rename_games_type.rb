class RenameGamesType < ActiveRecord::Migration[5.0]
  def change
    rename_column :games, :type, :game_type
  end
end
