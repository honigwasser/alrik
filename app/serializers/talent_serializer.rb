class TalentSerializer < ActiveModel::Serializer
  attributes Talent.new.attributes.keys.map(&:to_sym)
end
