class Base < Grape::API
  mount HrmStaff
  mount HrmOffice
  mount HrmDesignation
  mount HrmRole
end


