class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_dashboard
    end
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_dashboard
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to login_path
  end

  private

  def redirect_dashboard
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
