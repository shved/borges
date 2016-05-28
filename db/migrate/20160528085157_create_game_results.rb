class CreateGameResults < ActiveRecord::Migration[5.0]
  def change
    create_table :game_results do |t|
      t.references :author, foreign_key: true
      t.references :game, foreign_key: true
      t.jsonb :body
      t.jsonb :props
    end
  end
end
