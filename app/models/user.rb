class User < ActiveRecord::Base
    has_many :recipes
    has_one :pantry
    has_secure_password(validations: false)
    # validates :username, presence: true, uniqueness: true
    # validates :email, presence: true, uniqueness: true
    # validates :password, presence: true
end
