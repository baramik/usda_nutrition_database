class AddLongDescriptionToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :long_description, :string
  end
end
