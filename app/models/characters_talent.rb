class CharactersTalents < ActiveModel::Base
  belongs_to :character
  belongs_to :talent
end
