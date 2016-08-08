class CreatePendingGameSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :pending_game_sessions do |t|
      t.references :game, foreign_key: true
      t.text :text
      t.jsonb :props
      t.string :hex
      t.timestamps
    end
  end
end
