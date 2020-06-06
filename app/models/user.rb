class User < ActiveRecord::Base
  belongs_to :role
  after_create :updateRoleId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  def updateRoleId
    userRoleId=Role.find_by(name:"user")
    self.role_id=userRoleId.id
    if self.paid_videos_validity.present?
      self.paid_videos_validity = Date.today + 3650
    else
      self.paid_videos_validity = Date.today - 1
    end


    self.save
  end
  

end
