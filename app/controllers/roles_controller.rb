class RolesController < ApplicationController
  # skip_after_action :authorize
  def index
    @roles = Role.all
  end

  def new
  end

  def create
  end
end
