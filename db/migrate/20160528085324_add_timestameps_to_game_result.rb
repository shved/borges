class AddTimestamepsToGameResult < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:game_results)
  end
end
