class Job < ActiveRecord::Base
  # has_many :users, through: :applications
  belongs_to :mentor, class_name: "User"
  has_many :applications
  has_many :mentees, through: :applications
end
