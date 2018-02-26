class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def authenticate_by_email_password(email,password)
  	result = false

  	user = User.find_by(email: email)
  	result = user if user.present? && user.valid_password?(password)

  	result
  end
end
