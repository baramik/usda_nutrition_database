class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.references :food_categories, index: true

      t.timestamps null: false
    end
  end
end
