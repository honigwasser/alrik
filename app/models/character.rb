class Character < ActiveRecord::Base
  has_many :talents, through: :characters_talents
  has_many :characters_talents
  has_one :history
end
