# coding: utf-8
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    success_msg @users
  end

  # GET /users/1
  def show
    success_msg @user
  end

  # POST /users
  def create
    @user = User.new(user_name: params[:user_name],
                         nick_name: params[:nick_name],
                         password: params[:password])
    if @user.save
      success_msg @user
    else
      err_msg @user.errors.messages
    end
  end

  # PATCH/PUT /users/1
  def update
    p = {user_name: params[:user_name],
         nick_name: params[:nick_name]
        }.compact
    if @user.update(p)
      success_msg @user
    else
      err_msg @user.errors.messages
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def search
  end

  def modify_password
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
