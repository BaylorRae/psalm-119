class Verse < ApplicationRecord
  def to_param
    number&.to_s
  end
end
