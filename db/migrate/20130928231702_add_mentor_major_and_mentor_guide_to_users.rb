class AddMentorMajorAndMentorGuideToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mentor_major, :string
    add_column :users, :mentor_guide, :text
  end
end
