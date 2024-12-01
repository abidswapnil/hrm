class CreateOffices < ActiveRecord::Migration[7.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.integer :category
      t.integer :division
      t.string :district
      t.string :address

      t.timestamps
    end
  end
end
