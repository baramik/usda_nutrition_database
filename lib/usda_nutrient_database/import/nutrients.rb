module UsdaNutrientDatabase
  module Import
    class Nutrients < Base

      private

      def find_or_initialize(chunk_item)
        Nutrient.
            find_or_initialize_by(id: strip_leading_zeros_from_keys(chunk_item[:nutrient_number]))
      end

      def columns
        @columns ||= [
            :nutrient_number, :units, :tagname, :nutrient_description,
            :number_decimal_places, :sort_record_order
        ]
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
