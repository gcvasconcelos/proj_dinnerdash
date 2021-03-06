class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password validations: false
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

	validates :name, presence: true, length: { maximum: 50 }
	validates :password, presence: true, length: { minimum: 6 }
  
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, 
  								 length: { maximum: 200 },
  								 format: { with: VALID_EMAIL_FORMAT },
  								 uniqueness: {case_sensitive: false}

  before_save { self.email = email.downcase }
  validates :name, presence: true
end
