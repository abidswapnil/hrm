class CreateStaffs < ActiveRecord::Migration[7.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.integer :gender
      t.date :birthday
      t.string :hometown
      t.integer :blood_group
      t.string :designation
      t.string :integer

      t.timestamps
    end
  end
end
