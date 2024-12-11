class HrmStaff < Grape::API
  version "v1", using: :path
  format "json"
  prefix "api"

  # rescue_from :all

  resource :staffs do
    desc "Return all staffs"
    get do
      Staff.all
    end
  end

  desc "return a staff"
  params do
    requires :id, type: Integer, desc: "Staff ID"
  end

  resource :staffs do
    route_param :id do
      get do
        Staff.find(params[:id])
      end
    end
  end

  desc "Create a staff"
  params do
    requires :name, type: String, desc: "Staff Name"
    requires :email, type: String, desc: "Staff Email"
    requires :password, type: String, desc: "Staff Password"
    requires :password_confirmation, type: String, desc: "Staff Password Confirmation"
    requires :gender, type: String, desc: "Staff Gender"
    requires :birthday, type: String, desc: "Staff Birthday"
    requires :hometown, type: String, desc: "Staff Home Town"
    requires :blood_group, type: Integer, desc: "Staff BloodGroup"
    requires :designation, type: String, desc: "Staff Designation"
    requires :role, type: String, desc: "Staff Roles"
  end
  resource :staff do
    post do
      Staff.create(params)
      { message: "Staff created successfully." }
    end
  end

  desc "Update a staff's name"
  params do
    requires :id, type: Integer, desc: "Staff ID"
    requires :name, type: String, desc: "Staff name"
    requires :password, type: String, desc: "Staff Password"
    requires :password_confirmation, type: String, desc: "Staff Password Confirmation"
  end
  resource :staffs do
    route_param :id do
      patch do
        Staff.find(params[:id]).update(name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
        {message: "Staff updated successfully."}
      end
    end
  end

  desc "Update a staff"
  params do
    requires :name, type: String, desc: "Staff Name"
    requires :email, type: String, desc: "Staff Email"
    requires :password, type: String, desc: "Staff Password"
    requires :password_confirmation, type: String, desc: "Staff Password Confirmation"
    requires :gender, type: String, desc: "Staff Gender"
    requires :birthday, type: String, desc: "Staff Birthday"
    requires :hometown, type: String, desc: "Staff Home Town"
    requires :blood_group, type: Integer, desc: "Staff BloodGroup"
    requires :designation, type: String, desc: "Staff Designation"
    requires :role, type: String, desc: "Staff Roles"
  end
  resource :staffs do
    route_param :id do
      put do
        Staff.find(params[:id]).
          update(params)
        {message: "Staff updated successfully."}
      end
    end
  end

  desc "Delete a staff"
  params do
    requires :id, type: Integer, desc: "Staff ID"
  end
  resource :staffs do
    route_param :id do
      delete do
        Staff.find(params[:id]).destroy
        { message: "Staff deleted successfully." }
      end
    end
  end
end


