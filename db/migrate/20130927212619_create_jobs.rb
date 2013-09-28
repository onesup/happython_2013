class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :mentor, index: true
      t.string :category
      t.string :title
      t.text :content
      t.text :time
      t.string :level
      t.integer :workers_count
      t.integer :pay
      t.string :address

      t.timestamps
    end
  end
end