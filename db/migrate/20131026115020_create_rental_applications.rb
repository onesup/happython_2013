class CreateRentalApplications < ActiveRecord::Migration
  def change
    create_table :rental_applications do |t|
      t.integer  "guest_id"
      t.integer  "rental_book_id"
      t.boolean  "confirm"
      t.datetime "confirmed_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end
  end
end
