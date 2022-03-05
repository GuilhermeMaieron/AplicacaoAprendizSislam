class ApplicationController < ActionController::Base
  include ApplicationHelper
  add_flash_types :l_errado, :sucesso
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :verificaruser

  private
    def logged_in
      !!session[:user_id]
    end
    


    def verificaruser
        if !current_user
          flash[:l_errado] = "Você precisa estar logado para fazer isso."
          redirect_to users_path
        end
    end
end
