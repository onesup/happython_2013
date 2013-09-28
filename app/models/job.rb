class Job < ActiveRecord::Base
  belongs_to :mentor, class_name: "User"
  has_many :applications
  has_many :mentees, through: :applications
  serialize :time
end
