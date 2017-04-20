class Phrase < ApplicationRecord
  validates_presence_of :text
  belongs_to :user
  has_many :favorites

  def mark_favorite user
    return if Favorite.where(user: user, phrase: self).present?
    Favorite.create(user: user, phrase: self)
  end
end
