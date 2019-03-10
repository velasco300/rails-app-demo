# coding: utf-8
class SessionsController < ApplicationController
  skip_before_action :app_session_auth, only: [:login]

  def index
    1/0
  end

  def login
    @user = User.find_by(user_name: params[:user_name]).try(:authenticate, params[:password])
    if @user
      t = JSONWebToken::HMACToken.new
      t[:user_id] = @user.id
      t[:nick_name] = @user.nick_name
      success_msg t.encoded
    else
      err_msg '用户名或密码错误'
    end
  end

end
