class TalentSerializer < ActiveModel::Serializer
  attributes Talent.new.attributes.keys.map(&:to_sym)

  def name
    object.talent_type.name
  end
end
