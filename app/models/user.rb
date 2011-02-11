class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  def member_of_admins?
    !groups.find_by_name('Admins').blank?
  end
  def self.no_admin_yet?
    false
    #find_by_is_admin(true).blank?
  end
  def create_root_folder_and_admins_group
    Folder.create(:name => 'Root folder')
    groups << Group.create(:name => 'Admins')
  end

end
