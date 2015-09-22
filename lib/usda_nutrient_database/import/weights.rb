module UsdaNutrientDatabase
  module Import
    class Weights < Base

      private

      def find_or_initialize(chunk_item)
        Weight.find_or_initialize_by(
            food_item_id: strip_leading_zeros_from_keys(chunk_item[:nutrient_databank_number]),
            sequence_number: chunk_item[:sequence_number]
        )
      end

      def filename
        'WEIGHT.txt'
      end

      def columns
        @columns ||= [
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
