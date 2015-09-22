module UsdaNutrientDatabase
  module Import
    class Foods < Base

      private

      def find_or_initialize(chunk_item)
        FoodItem.find_or_initialize_by(
            id: strip_leading_zeros_from_keys(chunk_item[:nutrient_databank_number]),
            food_category_id: strip_leading_zeros_from_keys(chunk_item[:food_group_code])
        )
      end

      def filename
        'FOOD_DES.txt'
      end

      def columns
        [
            :nutrient_databank_number, :food_group_code, :long_description,
            :short_description, :common_names, :manufacturer_name, :survey,
            :refuse_description, :percentage_refuse, :nitrogen_factor,
            :protein_factor, :fat_factor, :carbohydrate_factor
        ]
      end

      def log_import_started
        Rails.logger.debug 'Importing foods'
      end

    end
  end
end
