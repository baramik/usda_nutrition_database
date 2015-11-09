class FoodItem < ActiveRecord::Base
  belongs_to :food_category
  has_many :nutrients, through: :foods_nutrients
  has_many :footnotes
  has_many :weights
  has_many :foods_nutrients, dependent: :nullify

  def as_json(options = {})
    super(include: {
              food_category: {only: [:id]},
              nutrients: {only: [:id]},
              footnotes: {only: [:id]},
              weights: {only: [:id]},
              foods_nutrients: {only: [:id]}
          })
  end

end
