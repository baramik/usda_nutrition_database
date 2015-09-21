class RenameFoodCategoriesIdToFoodCategoryId < ActiveRecord::Migration
  def change
    rename_column :food_items, :food_categories_id, :food_category_id
    # rename_index :food_items, 'index_food_items_on_food_categories_id', 'index_food_items_on_food_category_id'
  end
end
