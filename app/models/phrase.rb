class Phrase < ApplicationRecord
  validates_presence_of :text
  belongs_to :user
  has_many :favorites
end
