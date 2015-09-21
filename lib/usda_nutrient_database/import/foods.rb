module UsdaNutrientDatabase
  module Import
    class Foods < Base

      private

      def apply_typecasts(row)
        row[6] = row[6].present?
        row
      end

      def find_or_initialize(row)
        FoodItem.find_or_initialize_by(
            id: strip_leading_zeros_from_keys(row[0]),
            food_category_id: strip_leading_zeros_from_keys(row[1])
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
