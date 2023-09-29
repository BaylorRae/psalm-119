class Verse < ApplicationRecord
  has_many :verse_commentaries
  has_many :commentaries, through: :verse_commentaries

  def to_param
    number&.to_s
  end
end
