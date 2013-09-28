class AddFarmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :farm, :string
  end
end
