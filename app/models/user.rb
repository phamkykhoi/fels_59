class User < ActiveRecord::Base
  has_many :lessons, dependent: :destroy

  has_secure_password

  validates :name, length: {minimum:6, too_short: I18n.t(:user_error_too_short)}
  validates_uniqueness_of :name                  

  validates :email, length: {minimum:6, too_short: I18n.t(:user_error_too_short)}
  validates_uniqueness_of :email
  
  validates :password, length: {minimum:6, too_short: I18n.t(:user_error_too_short)}
end
