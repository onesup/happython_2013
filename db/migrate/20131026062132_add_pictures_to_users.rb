class AddPicturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :baby_picture, :string
    add_column :users, :baby_name, :string
    add_column :users, :latlng, :text
  end
end
