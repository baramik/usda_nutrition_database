module UsdaNutrientDatabase
  module Import
    class Weights < Base

      private

      def filename
        'WEIGHT.txt'
      end

      def import_class
        'Weight'.constantize
      end

      def additional_import_values(chunk_item)
        {
            food_item_id: strip_leading_zeros_from_keys(chunk_item[:nutrient_databank_number])
        }
      end

      def columns
        [
            :nutrient_databank_number, :sequence_number, :amount,
            :measurement_description, :gram_weight, :num_data_points,
            :standard_deviation
        ]
      end

      def log_import_started
        Rails.logger.debug 'Importing weights'
      end
    end
  end
end
