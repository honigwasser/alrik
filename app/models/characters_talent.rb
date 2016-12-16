class CharactersTalent < ActiveRecord::Base
  belongs_to :character
  belongs_to :talent
end
