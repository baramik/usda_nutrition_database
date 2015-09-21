class RenameNdbnoToNutrientDatabankNumber < ActiveRecord::Migration
  def change
    rename_column :food_items, :ndbno, :nutrient_databank_number
  end
end
