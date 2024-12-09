class StaffsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_staff, only: %i[ show edit update destroy ]

  # GET /staffs or /staffs.json
  def designation_name(id)
    Designation.find_by(id: id)&.name
  end
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1 or /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @designations = Designation.all
    if Staff.exists? and session[:staff_id].nil?
      redirect_to root_path
    else
      @staff = Staff.new
    end
   end

  # GET /staffs/1/edit
  def edit
    @designations = Designation.all
  end

  # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)
    respond_to do |format|
      if @staff.save
        format.html { redirect_to staffs_path, notice: "Staff '#{@staff.name}' was successfully created." }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staffs_path, notice: "Staff '#{@staff.name}' was successfully updated." }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy!

    respond_to do |format|
      format.html { redirect_to staffs_path, status: :see_other, alert: "Staff '#{@staff.name}' was destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(:name, :email, :password, :password_confirmation, :gender, :birthday, :hometown, :blood_group, :designation, :role)
    end
end
