class AddColumnsToNutrient < ActiveRecord::Migration
  def change
    add_column :nutrients, :nutrient_number, :string
    add_column :nutrients, :units, :string
    add_column :nutrients, :tagname, :string
    add_column :nutrients, :nutrient_description, :string
    add_column :nutrients, :number_decimal_places, :string
    add_column :nutrients, :sort_record_order, :string
  end
end
