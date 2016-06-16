class RenameBodyInText < ActiveRecord::Migration[5.0]
  def change
    rename_column :game_sessions, :body, :text
  end
end
