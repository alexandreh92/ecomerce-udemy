# frozen_string_literal: true

class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: CategoryDatatable.new(params, view_context: view_context) }
    end
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    respond_to do |format|
      if @category.save
        format.html { redirect_to new_backoffice_category_path, notice: "Category #{@category.description} was sucessfully created!" }
        format.json {}
      else
        format.html { render :new }
        format.json {}
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(params_category)
        format.html { redirect_to backoffice_categories_path, notice: "Category #{@category.description} was sucessfully updated!" }
        format.json {}
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    set_category
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_categories_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def params_category
    params.require(:category).permit(:description)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end
end
