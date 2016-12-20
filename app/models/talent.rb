class Talent < ActiveRecord::Base
  belongs_to :character
  belongs_to :talent_type
end
