class CreateResultLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :result_likes do |t|
      t.references :game_result, foreign_key: true
      t.references :author, foreign_key: true
      t.timestamps
    end
  end
end
