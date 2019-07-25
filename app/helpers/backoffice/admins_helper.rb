# frozen_string_literal: true

module Backoffice::AdminsHelper
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    Admin.roles.map do |key, _value|
      OptionsForRoles.new(key, key)
    end
  end
end
