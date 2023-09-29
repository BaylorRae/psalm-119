class VerseCommentary < ApplicationRecord
  belongs_to :verse
  belongs_to :commentary
end
