class RentalApplication < ActiveRecord::Base
  belongs_to :guest, class_name: "User"
  belongs_to :rental_book
end
