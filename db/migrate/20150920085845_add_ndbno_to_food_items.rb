class AddNdbnoToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :ndbno, :string
  end
end
