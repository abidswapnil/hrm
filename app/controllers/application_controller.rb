class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authorize
  allow_browser versions: :modern


  def current_staff
    @curr_staff ||= Staff.find(session[:staff_id]).name if session[:staff_id]
  end

  protected
  def authorize
    puts "****** #{session[:staff_id] ? session[:staff_id] : 'nil'} ********"
    unless session[:staff_id]
      redirect_to login_url
    end
  end

end
