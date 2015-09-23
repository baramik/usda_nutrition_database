module UsdaNutrientDatabase
  module Import
    class Nutrients < Base

      private

      def columns
        [
            :nutrient_number, :units, :tagname, :nutrient_description,
            :number_decimal_places, :sort_record_order
        ]
      end

      def import_class
        'Nutrient'.constantize
      end

      def additional_import_values(chunk_item)
        {
            id: strip_leading_zeros_from_keys(chunk_item[:nutrient_number]),
        }
      end

      def filename
        'NUTR_DEF.txt'
      end

      def log_import_started
        Rails.logger.debug 'Importing nutrients'
      end
    end
  end
end
