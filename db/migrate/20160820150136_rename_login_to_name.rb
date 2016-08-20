class RenameLoginToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :authors, :login, :name
  end
end
