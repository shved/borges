class ChangeBodyType < ActiveRecord::Migration[5.0]
  def change
    change_column :game_results, :body, :text
  end
end
