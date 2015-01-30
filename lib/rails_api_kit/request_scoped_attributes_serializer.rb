# Filter serializer attributes based on scope.serialize_fields
# scope property such as FieldsSerializationScope have
#
# Add to your *Serializer or to parent ApplicationSerializer if you have:
# class *Serializer < ActiveModel::Serializer
#   include RailsApiKit::RequestScopedAttributesSerializer
#   ...
# end
module RailsApiKit::RequestScopedAttributesSerializer

  def filter(keys)
    keys = super(keys)

    return keys unless scope.respond_to? :serialize_fields
    return keys unless scope.respond_to? :fields_for

    if !scope.serialize_fields.nil? && scope.fields_for == self.class.root_name.pluralize
      # subset of keys, where key is in serialize_fields
      return keys - (keys - scope.serialize_fields)
    end

    return keys
  end

end