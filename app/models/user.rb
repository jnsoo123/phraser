class User < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :phrases

  def admin?
    role == "admin"
  end
end
