class RentalBook < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  belongs_to :book
  has_many :rental_applications
  has_many :guest, through: :rental_applications

end
