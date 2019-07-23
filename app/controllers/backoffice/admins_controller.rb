# frozen_string_literal: true

class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
    respond_to do |format|
      format.html
      format.json { render json: AdminDatatable.new(params, view_context: view_context) }
    end
  end

  def show; end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to new_backoffice_admin_path, notice: "Admin #{@admin.email} was sucessfully created!" }
        format.json {}
      else
        format.html { render :new }
        format.json {}
      end
    end
  end

  def update
    respond_to do |format|
      passwd = params[:admin][:password]
      passwd_confirmation = params[:admin][:password_confirmation]

      if passwd.blank? && passwd_confirmation .blank?
        params[:admin].delete(:password)
        params[:admin].delete(:password_confirmation)
      end

      if @admin.update(params_admin)
        format.html { redirect_to backoffice_admins_path, notice: "Admin #{@admin.email} was sucessfully updated!" }
        format.json {}
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    set_admin
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_admins_path, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end
end
