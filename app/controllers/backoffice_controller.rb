# frozen_string_literal: true

class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'backoffice'

  def current_user
    current_admin # Current User for pundit
  end
end
