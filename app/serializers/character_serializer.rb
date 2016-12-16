class CharacterSerializer < ActiveModel::Serializer
  attributes Character.new.attributes.keys.map(&:to_sym)
  has_many :talents
end
