class Commentary < ApplicationRecord
  has_many :verse_commentaries
  has_many :verses, through: :verse_commentaries
end
