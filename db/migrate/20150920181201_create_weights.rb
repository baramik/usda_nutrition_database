class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.references :food_item, index: true
      t.string  :nutrient_databank_number, null: false, index: true
      t.string  :sequence_number, null: false
      t.float   :amount, null: false
      t.string  :measurement_description, null: false
      t.float   :gram_weight, null: false
      t.integer :num_data_points
      t.float   :standard_deviation

      t.timestamps null: false
    end
  end
end
