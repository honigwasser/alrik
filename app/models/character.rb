class Character < ActiveRecord::Base
  has_many :talents
  has_many :basic_attributes
  has_one :history
end
