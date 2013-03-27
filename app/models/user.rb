class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :page_views
  has_many :authentications

  def password_required?
    super && authentications.empty?
  end

  def email_required?
    super && authentications.empty?
  end

  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    self.username = omniauth['info']['nickname']
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

end
