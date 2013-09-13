class ApplicationController < ActionController::Base
  include TheRoleController
  protect_from_forgery with: :exception
  
  # your Access Denied processor
  def access_denied
    return render(text: '승인이 필요합니다. 관리자에게 문의하세요^^')
  end

  # Define method aliases for the correct TheRole's controller work
  alias_method :login_required,     :authenticate_user!
  alias_method :role_access_denied, :access_denied

end
