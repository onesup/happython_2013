class User < ActiveRecord::Base
  include TheRoleUserModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, 
  :validatable, :omniauthable, :omniauth_providers => [:facebook]# , :confirmable 
  
  has_many :works, class_name: "Job", foreign_key: "mentor_id"
  has_many :jobs, through: :applications, foreign_key: "mentee_id"
  has_many :applications, foreign_key: "mentee_id"
  has_many :reviews
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :farm, FarmUploader
  mount_uploader :baby_picture, BabyPictureUploader
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                          )
    end
    user
  end
  
  def current_works
    self.works
  end
end
