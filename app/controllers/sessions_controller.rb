class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = nil
      redirect_to cookies[:path] || root_path
      cookies.delete :path
    else
      flash[:alert] = 'Wrong login or password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
