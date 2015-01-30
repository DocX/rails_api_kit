# Filter serializer attributes based on Pundit policy rule
# via readable_attributes(attributes) method that return array
# of allowed attributes (may be based on given attributes)
#
# Add to your *Serializer or to parent ApplicationSerializer if you have:
# class SomeModelSerializer < ActiveModel::Serializer
#   include RailsApiKit::PolicyScopedAttributesSerializer
#   ...
# end
#
# and add readable_attributes method to your policy class
# class SomeModelPolicy
#   ...
#   def readable_attributes(attributes)
#     return attributes if user.admin?
#     return []
#   end
#   ...
# end
module RailsApiKit
  module PolicyScopedAttributesSerializer

    def filter(keys)
      keys = super(keys)

      policy_class = (self.class.name.underscore.sub(/_serializer$/,'_policy').classify.constantize rescue nil)
      return keys unless policy_class

      policy = policy_class.new(scope.user, object)
      return keys unless policy.respond_to? :readable_attributes

      # subset of keys vhere key is in readable_attributes
      return keys - (keys - policy.readable_attributes(keys))
    end

  end
end