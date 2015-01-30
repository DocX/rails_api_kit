# Serialization scope storing fields paramter
# from controller request used in serializers
# to filter only wanted attributes using
# RequestScopedAttributesSerializer
#
# Scope also mimics user methods to support partially
# serializers relying on that scope == current_user
class RailsApiKit::FieldsSerializationScope
  attr_accessor :user, :serialize_fields, :fields_for, :options

  def method_missing(name, *args, &block)
    if user.respond_to? name
      user.send(name, *args, &block)
    else
      raise NoMethodError.new ("Undefined method '#{name}' for user in UserWithFieldsScope")
    end
  end
end