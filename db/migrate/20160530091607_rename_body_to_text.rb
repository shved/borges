class RenameBodyToText < ActiveRecord::Migration[5.0]
  def change
    rename_column :theme_suggestions, :body_ru, :text_ru
    rename_column :theme_suggestions, :body_en, :text_en
  end
end
