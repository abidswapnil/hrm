class RolesController < ApplicationController
  # skip_after_action :authorize
  before_action :set_role, only: %i[ show edit update destroy ]
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def show
  end

  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: "role '#{@role.name}' was successfully created." }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: "role #{@role.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @role.destroy!

    respond_to do |format|
      format.html { redirect_to roles_path, status: :see_other, alert: "role '#{@role.name}' was destroyed!" }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def role_params
    params.require(:role).permit(:name)
  end

end
