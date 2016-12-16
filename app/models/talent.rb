class Talent < ActiveRecord::Base
  has_many :characters, through: :characters_talents
  has_many :characters_talents
end
