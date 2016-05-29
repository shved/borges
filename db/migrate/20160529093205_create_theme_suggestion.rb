class CreateThemeSuggestion < ActiveRecord::Migration[5.0]
  def change
    create_table :theme_suggestions do |t|
      t.text :body_ru
      t.text :body_en
      t.jsonb :game_types
    end
  end
end
