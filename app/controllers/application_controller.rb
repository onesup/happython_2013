#encoding: utf-8
class ApplicationController < ActionController::Base
  include TheRoleController
  protect_from_forgery with: :exception
  
  # your Access Denied processor
  def access_denied
    return render(text: 'something wrong.')
  end

  # Define method aliases for the correct TheRole's controller work
  alias_method :login_required,     :authenticate_user!
  alias_method :role_access_denied, :access_denied

end
