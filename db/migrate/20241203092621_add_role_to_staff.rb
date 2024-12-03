class AddRoleToStaff < ActiveRecord::Migration[7.2]
  def change
    add_column :staffs, :role, :integer
  end
end
