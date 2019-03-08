class ApplicationController < ActionController::API
  before_action :app_session_auth

  rescue_from Exception do |e|
    puts "rescue_from------#{Rails.env}------#{e.class}------#{e.code}------#{e.msg}"
    puts e.backtrace
    render json: {success: false, code: e.code, msg: e.msg}
  end

  private
  def app_session_auth
    puts "app_session_auth------#{self.class.name}------#{params[:action]}"
  end
end
