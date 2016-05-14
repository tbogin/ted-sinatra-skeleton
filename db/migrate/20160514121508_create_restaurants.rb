class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :cuisine, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.references :user
      t.timestamps null: false
    end
  end
end
