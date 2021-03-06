module UsdaNutrientDatabase
  module Import
    class Footnotes < Base

      private

      def filename
        'FOOTNOTE.txt'
      end

      def columns
        [
            :nutrient_databank_number, :footnote_number, :footnote_type,
            :nutrient_number, :footnote_text
        ]
      end

      def import_class
        'Footnote'.constantize
      end

      def additional_import_values(chunk_item)
        {
            food_item_id: strip_leading_zeros_from_keys(chunk_item[:nutrient_databank_number]),
            footnote_id: strip_leading_zeros_from_keys(chunk_item[:footnote_number]),
            nutrient_id: strip_leading_zeros_from_keys(chunk_item[:nutrient_number])
        }
      end

      def log_import_started
        Rails.logger.debug 'Importing footnotes'
      end
    end
  end
end
