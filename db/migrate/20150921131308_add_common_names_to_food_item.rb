class AddCommonNamesToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :common_names, :string
  end
end
