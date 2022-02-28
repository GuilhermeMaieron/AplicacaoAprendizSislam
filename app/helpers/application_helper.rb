module ApplicationHelper
  def current_user
    @current_user ||= Login.find_by_id(session[:login_id]) if !!session[:login_id]
  end
end
