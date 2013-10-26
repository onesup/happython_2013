class CreateRentalBooks < ActiveRecord::Migration
  def change
    create_table :rental_books do |t|
      t.integer  "host_id"
      t.string   "category"
      t.string   "title"
      t.text     "contents"
      t.datetime "started_at"
      t.datetime "finished_at"
      t.integer  "days"
      t.integer  "start_time"
      t.integer  "finish_time"
      t.integer  "star"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end
  end
end
