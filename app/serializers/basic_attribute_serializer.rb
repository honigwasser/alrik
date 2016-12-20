class BasicAttributeSerializer < ActiveModel::Serializer
  attributes BasicAttribute.new.attributes.keys.map(&:to_sym)

  def name
    object.basic_attribute_type.name
  end
end
