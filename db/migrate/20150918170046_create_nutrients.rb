class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.string :name
      t.string :unit
      t.references :nutrient_categories, index: true

      t.timestamps null: false
    end
  end
end
