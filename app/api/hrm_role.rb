class HrmRole < Grape::API
  version "v1", using: :path
  format "json"
  prefix "api"

  rescue_from :all

  resource :roles do
    desc "Return all Roles"
    get do
      Role.all
    end
  end

  desc "return a Role"
  params do
    requires :id, type: Integer, desc: "Role ID"
  end

  resource :roles do
    route_param :id do
      get do
        Role.find(params[:id])
      end
    end
  end

  desc "Create a Role"
  params do
    requires :name, type: String, desc: "Role Name"
  end
  resource :roles do
    post do
      Role.create(params)
      { message: "Role created successfully." }
    end
  end

  desc "Update Role"
  params do
    requires :id, type: Integer, desc: "Role ID"
    requires :name, type: String, desc: "Role Name"
  end
  resource :roles do
    route_param :id do
      patch do
        Role.find(params[:id]).update(name: params[:name])
        {message: "Role updated successfully."}
      end
    end
  end

  desc "Update a Role"
  params do
    requires :name, type: String, desc: "Role Name"
  end
  resource :roles do
    route_param :id do
      put do
        Role.find(params[:id]).
          update({ name: params[:name]})
        {message: "Role updated successfully."}
      end
    end
  end

  desc "Delete a Role"
  params do
    requires :id, type: Integer, desc: "Role ID"
  end
  resource :roles do
    route_param :id do
      delete do
        Role.find(params[:id]).destroy
        { message: "Role deleted successfully." }
      end
    end
  end
end


