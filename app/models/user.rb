class User < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :phrases
  has_many :favorites
  has_many :fave_phrases, through: :favorites, source: :phrase

  def admin?
    role == "admin"
  end
end
