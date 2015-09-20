class FoodItem < ActiveRecord::Base
  belongs_to :food_category
  has_many :nutrients, through: :foods_nutrients
  has_many :footnotes
  has_many :weights
  has_many :foods_nutrients, dependent: :nullify
end
