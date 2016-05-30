class RenameGameResultsToGameSessions < ActiveRecord::Migration[5.0]
  def change
    rename_table :game_results, :game_sessions
  end
end
