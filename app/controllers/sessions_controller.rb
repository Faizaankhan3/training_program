class SessionsController < ApplicationController
  
  before_action :logged_out_user, only: [:create, :new]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if(user.admin_user==false)
        redirect_to home_path
      else
        redirect_to dash_path
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
