class ChangeColumnsToBooks < ActiveRecord::Migration
  def change
    change_column :books, :description, :text
    change_column :books, :authors, :text
  end
end
