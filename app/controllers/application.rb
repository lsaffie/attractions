# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_aint_nobody_here_but_us_chickens'

  include AuthenticatedSystem
  
  helper_method :admin?
  
  protected
  
  def authorize
    unless admin?
      flash[:error] = "Unauthorized Access"
      redirect_to login
      false
    end
  end
  
  def admin?
    #session[:password] == "foobar"
    session[:logged_in]
  end

end
