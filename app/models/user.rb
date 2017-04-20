class User < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :phrases
  has_many :favorites

  def admin?
    role == "admin"
  end
end
