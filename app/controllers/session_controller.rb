class SessionController < ApplicationController
  skip_before_action :authorize
  def new
    if session[:staff_id]
      redirect_to root_path
    end
  end
  def create
    curr_staff = Staff.find_by(email: params[:email])
    if curr_staff&.authenticate(params[:password])
      session[:staff_id] = curr_staff.id
      redirect_to root_path
      # puts "#{session[:staff_id]} after sign in"
    else
      redirect_to login_url, alert: "Wrong credentials!"
    end
  end

  def destroy
    session[:staff_id] = nil
    redirect_to login_url
    # puts "#{session[:staff_id]} after sign out"
  end

end
