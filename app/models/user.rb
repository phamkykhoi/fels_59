class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save {self.email = email.downcase}

  has_many :lessons, dependent: :destroy

  has_secure_password

  validates :name, length: {minimum: Settings.user_name_min_long, too_short: I18n.t(:user_error_too_short)}, uniqueness: true  
  
  validates :email, length: {minimum:Settings.user_email_min_long, too_short: I18n.t(:user_error_too_short)}, uniqueness: true  
    
  validates :password, length: {minimum: Settings.user_password_min_long, too_short: I18n.t(:user_error_too_short)}
end
