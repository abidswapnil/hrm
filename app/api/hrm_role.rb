class HrmRole < Grape::API
  version "v1", using: :path
  format "json"
  prefix "api"

  resource :roles do
    get do
      Role.all
    end
  end
end


