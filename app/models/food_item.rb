class FoodItem < ActiveRecord::Base
  belongs_to :food_category
  has_many :nutrients, through: :nutrient_values
end
