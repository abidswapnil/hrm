class HrmDesignation < Grape::API
  version "v1", using: :path
  format "json"
  prefix "api"

  resource :designations do
    get do
      Designation.all
    end
  end
end
