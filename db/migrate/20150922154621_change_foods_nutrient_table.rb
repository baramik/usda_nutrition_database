class ChangeFoodsNutrientTable < ActiveRecord::Migration
  def change
    change_column_default :foods_nutrients, :add_nutrient_mark, false
  end
end
