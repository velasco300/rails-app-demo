class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  def index
    @roles = Role.all
    success_msg @roles
  end

  def show
    success @role
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      success_msg @role
    else
      err_msg @role.errors.messages
    end
  end

  def update
    if @role.update(role_params)
      success @role
    else
      err_msg @role.errors.messages
    end
  end

  def destroy
    @role.destroy
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:nick_name)
    end
end
