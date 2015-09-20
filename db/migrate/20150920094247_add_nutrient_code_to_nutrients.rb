class AddNutrientCodeToNutrients < ActiveRecord::Migration
  def change
    add_column :nutrients, :nutrient_code, :string
  end
end
