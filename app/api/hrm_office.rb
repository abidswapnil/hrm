class HrmOffice < Grape::API
  version "v1", using: :path
  format "json"
  prefix "api"

  rescue_from :all

  resource :offices do
    desc "Return all Offices"
    get do
      Office.all
    end
  end

  desc "return a Office"
  params do
    requires :id, type: Integer, desc: "Office ID"
  end

  resource :offices do
    route_param :id do
      get do
        Office.find(params[:id])
      end
    end
  end

  desc "Create a Office"
  params do
    requires :name, type: String, desc: "Office Name"
    requires :category, type: String, desc: "Office category"
    requires :division, type: String, desc: "Office Password"
    requires :district, type: String, desc: "Office Password Confirmation"
    requires :address, type: String, desc: "Office Gender"
  end
  resource :office do
    post do
      Office.create(params)
      { message: "Office created successfully." }
    end
  end

  desc "Update office"
  params do
    requires :id, type: Integer, desc: "Office ID"
    requires :division, type: String, desc: "Office name"
  end
  resource :office do
    route_param :id do
      patch do
        Office.find(params[:id]).update(division: params[:division])
        # {message: "Office updated successfully."}
      end
    end
  end

  desc "Update a Office"
  params do
    requires :name, type: String, desc: "Office Name"
    requires :category, type: Integer, desc: "Office category"
    requires :division, type: Integer, desc: "Office Division"
    requires :district, type: Integer, desc: "Office District"
    requires :address, type: String, desc: "Office address"
  end
  resource :office do
    route_param :id do
      put do
        Office.find(params[:id]).
          update({ name: params[:name],
                   category: params[:category],
                   division: params[:division],
                   district: params[:district],
                   address: params[:address],
                 })
        # {message: "Office updated successfully."}
      end
    end
  end

  desc "Delete a Office"
  params do
    requires :id, type: Integer, desc: "Office ID"
  end
  resource :offices do
    route_param :id do
      delete do
        Office.find(params[:id]).destroy
        { message: "Office deleted successfully." }
      end
    end
  end
end


