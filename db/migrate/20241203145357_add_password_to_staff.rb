class AddPasswordToStaff < ActiveRecord::Migration[7.2]
  def change
    add_column :staffs, :password_digest, :string
  end
end
