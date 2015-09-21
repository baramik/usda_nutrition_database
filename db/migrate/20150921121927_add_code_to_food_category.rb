class AddCodeToFoodCategory < ActiveRecord::Migration
  def change
    add_column :food_categories, :code, :string
  end
end
