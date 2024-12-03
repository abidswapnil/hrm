class ChangeDesignationTypeToInteger < ActiveRecord::Migration[7.2]
  def change
    change_column :staffs, :designation, :integer, using: 'designation::integer'
  end
end
