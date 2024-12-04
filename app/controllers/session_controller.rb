class SessionController < ApplicationController
  def new
  end
  def create
    curr_staff = Staff.find_by(email: params[:email])
    if curr_staff&.authenticate(params[:password])
      session[:staff_id] = curr_staff.id
      redirect_to login_url, notice: "Logged in!"
    else
      redirect_to login_url, alert: "Login failed!"
    end
  end
end
