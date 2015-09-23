class AddScientificNameToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :scientific_name, :string
  end
end
