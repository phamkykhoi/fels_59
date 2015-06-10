class Check_user < ActiveModel::Validator
    
  def validate(record)
    if nil != record.id
      
    else
      if User.find_by_name(record.name)
        record.errors[:base] << "User name have been used"
      else
        if User.find_by_email(record.email)
          record.errors[:base] << "User email have been used"
        end
      end
    end
  end
end

class User < ActiveRecord::Base
  has_many :lessons, dependent: :destroy

  has_secure_password

  validates :name, length: {minimum:6, too_short: "must have at least %{count} words"}
  validates :password, length: {minimum:6, too_short: "must have at least %{count} words"}

  validates_with Check_user
end
