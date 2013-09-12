class User < ActiveRecord::Base
  include TheRoleUserModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :works, class_name: "Job", foreign_key: "mentor_id"
  has_many :jobs, through: :applications, foreign_key: "mentee_id"
  has_many :applications, foreign_key: "mentee_id"
         
  
end
