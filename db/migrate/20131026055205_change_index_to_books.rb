class ChangeIndexToBooks < ActiveRecord::Migration
  def change
    change_column :books, :index, :text
  end
end
