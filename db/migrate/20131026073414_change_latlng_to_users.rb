class ChangeLatlngToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat, :string
    add_column :users, :lng, :string
    remove_column :users, :latlng
  end
end
