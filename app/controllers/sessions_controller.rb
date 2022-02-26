class SessionsController < ApplicationController
  def create
    @employee = Employee.find_or_create_by(full_name: auth_hash.info.name, member_id: auth_hash.info.user_id)
    
     session[:empleoye_id] = @employee.id
     redirect_to '/'
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
