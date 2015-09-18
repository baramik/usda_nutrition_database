class Nutrient < ActiveRecord::Base
  belongs_to :nutrient_category
  has_many :food_items, through: :nutrient_values
end
