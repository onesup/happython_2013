class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :mentor, index: true
      t.string :category
      t.string :title
      t.text :content
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :days
      t.integer :start_time
      t.integer :finish_time
      t.integer :working_time
      t.integer :learning_time
      t.string :level
      t.integer :workers_count
      t.integer :pay
      t.string :address
      t.string :plays

      t.timestamps
    end
  end
end