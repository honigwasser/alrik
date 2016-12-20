class BasicAttribute < ActiveRecord::Base
  belongs_to :character
  belongs_to :basic_attribute_type
end
