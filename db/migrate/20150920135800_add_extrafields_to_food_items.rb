class AddExtrafieldsToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :food_group_code, :string
    add_column :food_items, :short_description, :string
    add_column :food_items, :manufacturer_name, :string
    add_column :food_items, :survey, :boolean
    add_column :food_items, :refuse_description, :string
    add_column :food_items, :percentage_refuse, :integer
    add_column :food_items, :nitrogen_factor, :float
    add_column :food_items, :protein_factor, :float
    add_column :food_items, :fat_factor, :float
    add_column :food_items, :carbohydrate_factor, :float
  end
end
