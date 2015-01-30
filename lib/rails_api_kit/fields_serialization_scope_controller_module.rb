# Module to enable use of FieldsSerializationScope
# as default serialization scope in controller
#
# Add as included module to your ApplicationController for global application:
# controller ApplicationController
# ...
#   include RailsApiKit::FieldsSerializationScopeControllerModule
# ...
#
module RailsApiKit
  module FieldsSerializationScopeControllerModule
    extend ActiveSupport::Concern

    included do
      serialization_scope :fields_serialiazation_scope
    end

    def fields_serialiazation_scope(options = {})
      scope = FieldsSerializationScope.new
      scope.user = current_user
      scope.serialize_fields = params[:fields].nil? ? nil : params[:fields].split(',').map(&:to_sym)
      scope.fields_for = controller_name
      scope.options = options
      scope
    end
  end
end