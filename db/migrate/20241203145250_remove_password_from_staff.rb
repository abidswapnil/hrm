class RemovePasswordFromStaff < ActiveRecord::Migration[7.2]
  def change
    remove_column :staffs, :password, :string
  end
end
