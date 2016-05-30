class RenameLikes < ActiveRecord::Migration[5.0]
  def change
    drop_table :result_likes
    create_table :likes do |t|
      t.references :game_session, foreign_key: true
      t.references :author, foreign_key: true
      t.timestamps
    end
  end
end
