class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :mentor, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
