module SessionsHelper
  
  def sign_in(user)
    # When a user signs in, use a cookie to give him his remember_token
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
  
  def current_user=(user)
    # Set the current user using a passed-in parameter
    @current_user = user
  end

  def current_user
    # If it is set
    #   return the current user.
    # If it is nil
    #   set the current user if the browser has a remember_token
    #   return the current user (or nil, if the browser does not have a remember_token)
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    # If the browser calling this code has a remember_token, then the user
    # will be found in the DB, @current_user will be given a value, and this
    # routine returns true. If @current_user already has a value, this routine
    # returns true without accessing the DB. i.e. A user will remain signed in
    # accross separate accesses to the web site (as long as the browser still
    # has its remember_token
    !current_user.nil? 
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
end
