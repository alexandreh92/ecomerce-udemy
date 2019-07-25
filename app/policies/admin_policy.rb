# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def new?
    user.full_acess?
  end

  def edit?
    user.full_acess?
  end

  def permitted_attributes # pundit strong params
    if user.full_acess?
      %i[name role email password password_confirmation]
    else
      %i[name email password password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      if user.full_acess?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
