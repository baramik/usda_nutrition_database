class CreateNutrientValues < ActiveRecord::Migration
  def change
    create_table :nutrient_values do |t|
      t.decimal :value, precision: 10, scale: 3
      t.references :food_items, index: true
      t.references :nutrients, index: true

      t.timestamps null: false
    end
  end
end
