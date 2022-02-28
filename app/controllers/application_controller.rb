class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :verificarlogin

  private
    def logged_in
      !!session[:login_id]
    end



    def verificarlogin
        if !current_user
          redirect_to logins_path
        end
    end
end
