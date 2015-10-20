class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #http://stackoverflow.com/questions/26943432/rails4devise-hide-routes-when-user-is-not-authenticated
  protect_from_forgery with: :exception


  private

  def authenticate
    unless logged_in?
      # Save our current path in the session to return back to
      # after logging in.  (Saml controller looks for this)
      logger.info "Goback URL is '#{request.url}'"
      session[:goback_to] = request.url
      redirect_to '/saml/sso' #, notice: "Please Login"
    end
  end

  def logged_in?
    return false if session[:user_id].nil?
    return false if session[:user_id] == ""
    return true
  end

end