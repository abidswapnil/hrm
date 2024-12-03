class CreateStaffs < ActiveRecord::Migration[7.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :gender
      t.date :birthday
      t.string :hometown
      t.integer :blood_group
      t.integer :designation
      t.integer :role

      t.timestamps
    end
  end
end
