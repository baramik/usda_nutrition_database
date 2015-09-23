module UsdaNutrientDatabase
  module Import
    class FoodGroups < Base

      private

      def columns
        %w(code name)
      end

      def filename
        'FD_GROUP.txt'
      end

      def import_class
        'FoodCategory'.constantize
      end

      def additional_import_values(chunk_item)
        {
            id: strip_leading_zeros_from_keys(chunk_item[:code])
        }
      end

      def log_import_started
        Rails.logger.debug 'Importing food groups'
      end
    end
  end
end
