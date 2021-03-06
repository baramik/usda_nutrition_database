class CreateFoodsNutrients < ActiveRecord::Migration
  def change
    create_table :foods_nutrients do |t|
      t.references :food_item, index: true
      t.references :nutrient, index: true
      t.string  :nutrient_databank_number, null: false
      t.string  :nutrient_number, null: false
      t.float   :nutrient_value, null: false
      t.integer :num_data_points, null: false
      t.float   :standard_error
      t.string  :src_code, null: false
      t.string  :derivation_code
      t.string  :ref_nutrient_databank_number
      t.boolean :add_nutrient_mark
      t.integer :num_studies
      t.float   :min
      t.float   :max
      t.integer :degrees_of_freedom
      t.float   :lower_error_bound
      t.float   :upper_error_bound
      t.string  :statistical_comments
      t.string  :add_mod_date
      t.string  :confidence_code
      t.timestamps null: false
    end
  end
end
