class RentalBook < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  has_many :rental_applications
  has_many :mentees, through: :applications
end
