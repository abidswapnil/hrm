class ChangeDistrictToInteger < ActiveRecord::Migration[7.2]
  def change
    change_column :offices, :district, :integer, using: 'district::integer'
  end
end
