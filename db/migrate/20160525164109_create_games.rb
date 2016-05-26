class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name_ru
      t.string :name_en
      t.jsonb :props
      t.string :type
    end
  end
end
