module UsdaNutrientDatabase
  module Import
    class FoodsNutrients < Base

      private

      def columns
        [
            :nutrient_databank_number, :nutrient_number, :nutrient_value,
            :num_data_points, :standard_error, :src_code, :derivation_code,
            :ref_nutrient_databank_number, :add_nutrient_mark, :num_studies, :min,
            :max, :degrees_of_freedom, :lower_error_bound, :upper_error_bound,
            :statistical_comments, :add_mod_date
        ]
      end

      def find_or_initialize(chunk_item)
        FoodsNutrient.find_or_initialize_by(
            food_item_id: strip_leading_zeros_from_keys(chunk_item[:nutrient_databank_number]),
            nutrient_id: strip_leading_zeros_from_keys(chunk_item[:nutrient_number])
        )
      end

      def filename
        'NUT_DATA.txt'
      end

      def log_import_started
        Rails.logger.debug 'Importing foods_nutrients'
      end
    end
  end
end
