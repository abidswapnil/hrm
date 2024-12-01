class ChangeDivisionToInteger < ActiveRecord::Migration[7.2]
  def change
    change_column :offices, :division, :integer, using: 'division::integer'
  end
end
