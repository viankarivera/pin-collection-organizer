class User < ActiveRecord::Base
    has_many :pins
    has_secure_password
    validates :username, presence: true, uniqueness: true 
end 