class SessionController < ApplicationController
  def new
  end
  def create
    @curr_session = session[:user_id]
  end
end
