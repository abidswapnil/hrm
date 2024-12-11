class HrmDesignation < Grape::API
  version "v1", using: :path
  format "json"
  prefix "api"

  rescue_from :all

  resource :designations do
    desc "Return all Designations"
    get do
      Designation.all
    end
  end

  desc "return a Designation"
  params do
    requires :id, type: Integer, desc: "Designation ID"
  end

  resource :designations do
    route_param :id do
      get do
        Designation.find(params[:id])
      end
    end
  end

  desc "Create a Designation"
  params do
    requires :name, type: String, desc: "Designation Name"
  end
  resource :designations do
    post do
      Designation.create(params)
      { message: "Designation created successfully." }
    end
  end

  desc "Update Designation"
  params do
    requires :id, type: Integer, desc: "Designation ID"
    requires :name, type: String, desc: "Designation Name"
  end
  resource :designations do
    route_param :id do
      patch do
        Designation.find(params[:id]).update(name: params[:name])
        {message: "Designation updated successfully."}
      end
    end
  end

  desc "Update a Designation"
  params do
    requires :name, type: String, desc: "Designation Name"
  end
  resource :designations do
    route_param :id do
      put do
        Designation.find(params[:id]).
          update({ name: params[:name]})
        {message: "Designation updated successfully."}
      end
    end
  end

  desc "Delete a Designation"
  params do
    requires :id, type: Integer, desc: "Designation ID"
  end
  resource :designations do
    route_param :id do
      delete do
        Designation.find(params[:id]).destroy
        { message: "Designation deleted successfully." }
      end
    end
  end
end


