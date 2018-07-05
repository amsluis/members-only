class SessionsController < ApplicationController

  def new
    #start a new session, 'log in'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      log_in(user)
    end
  end

  def destroy
    sign_out
    redirect_to(root_url)
  end

end
