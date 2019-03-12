# coding: utf-8
class ApplicationController < ActionController::API
  before_action :app_session_auth
  skip_before_action :app_session_auth, only: [:render_not_found]

  rescue_from Exception do |e|
    puts "------rescue_from------#{Rails.env}------#{e.class}------#{e.message}------"
    if AppException == e.class
      render json: {success: false, code: e.code, msg: e.msg}
    else
      puts e.backtrace
      render json: {success: false, code: '0x004', msg: '系统错误,请联系管理员!!!'}
    end
  end

  def render_not_found
    raise Exception
  end

  protected
  def success_msg(code = '0x001', msg = '成功', data)
    render json: {success: true, code: code, msg: msg, new_token: params[:new_token], data: data}
  end

  def err_msg(code = nil, msg)
    raise AppException.new code, msg
  end

  private
  def app_session_auth
    puts "------app_session_auth------#{self.class.name}------#{params[:action]}------"
    begin
      token = JSONWebToken::HMACToken.decode(request.headers[:Authorization].split(' ').first)[0]
      if Time.now.to_i - token['exp'] > 0
        t = JSONWebToken::HMACToken.new
        t[:user_id] = token['user_id']
        t[:nick_name] = token['nick_name']
        params[:new_token] = t.encoded
      end
      puts "------decode token is #{token}------"
    rescue Exception => err
      err_msg "鉴权失败: #{err}"
    end
  end
end
