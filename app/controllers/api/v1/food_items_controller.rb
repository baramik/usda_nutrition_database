class Api::V1::FoodItemsController < Api::V1::BaseController
  def index
    @food_items = FoodItem.order(:name).page(params[:page])
    render json: {food_items: @food_items,
                  meta_data: {total_count: @food_items.total_count, current_page: @food_items.current_page}}
  end
end