# frozen_string_literal: true

class Backoffice::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  layout 'backoffice'

  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: CategoryDatatable.new(params, view_context: view_context) }
    end
  end

  def show; end

  def create; end

  def update; end

  def edit; end

  def destroy; end
end
