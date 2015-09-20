class CreateFootnotes < ActiveRecord::Migration
  def change
    create_table :footnotes do |t|
      t.references :food_item, index: true
      t.references :nutrient, index: true
      t.string :nutrient_databank_number, null: false, index: true
      t.string :footnote_number, null: false, index: true
      t.string :footnote_type, null: false, index: true
      t.string :nutrient_number, index: true
      t.string :footnote_text, null: false

      t.timestamps null: false
    end
  end
end
