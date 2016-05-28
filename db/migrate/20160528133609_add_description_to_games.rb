class AddDescriptionToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :desc_ru, :text
    add_column :games, :desc_en, :text
  end
end
