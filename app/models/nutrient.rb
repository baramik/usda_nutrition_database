class Nutrient < ActiveRecord::Base
  belongs_to :nutrient_category
  has_many :food_items, through: :foods_nutrients
  has_many :foods_nutrients, dependent: :nullify
  has_many :footnotes
end
