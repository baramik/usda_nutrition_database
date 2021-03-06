module UsdaNutrientDatabase
  module Import
    class Foods < Base

      private

      def filename
        'FOOD_DES.txt'
      end

      def import_class
        'FoodItem'.constantize
      end

      def additional_import_values(chunk_item)
        {
            id: strip_leading_zeros_from_keys(chunk_item[:nutrient_databank_number]),
            food_category_id: strip_leading_zeros_from_keys(chunk_item[:food_group_code])
        }
      end

      def columns
        [
            :nutrient_databank_number, :food_group_code, :long_description,
            :short_description, :common_names, :manufacturer_name, :survey,
            :refuse_description, :percentage_refuse, :scientific_name, :nitrogen_factor,
            :protein_factor, :fat_factor, :carbohydrate_factor
        ]
      end

      def log_import_started
        Rails.logger.debug 'Importing foods'
      end

    end
  end
end
