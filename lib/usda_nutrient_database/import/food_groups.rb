module UsdaNutrientDatabase
  module Import
    class FoodGroups < Base

      private

      def find_or_initialize(chunk_item)
        FoodCategory.find_or_initialize_by(id: strip_leading_zeros_from_keys(chunk_item[:code]))
      end

      def columns
        @columns ||= %w(code name)
      end

      def filename
        'FD_GROUP.txt'
      end

      def log_import_started
        Rails.logger.debug 'Importing food groups'
      end
    end
  end
end
