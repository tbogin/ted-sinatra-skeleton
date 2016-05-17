class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.timestamps null: false
    end
  end
end
