class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :phrase

  validates_uniqueness_of :user_id, scope: :phrase_id
end
