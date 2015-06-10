class User < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
end
