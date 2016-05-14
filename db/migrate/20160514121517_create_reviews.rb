class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body
      t.references :user
      t.references :restaurant
      t.timestamps null: false
    end
  end
end
