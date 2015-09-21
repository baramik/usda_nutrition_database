module UsdaNutrientDatabase
  module Import
    class FoodGroups < Base

      private

      def find_or_initialize(row)
        FoodCategory.find_or_initialize_by(id: strip_leading_zeros_from_keys(row[0]))
      end

      def columns
        @columns ||= %w(code name)
      end

      def build_object(row)
        find_or_initialize(row).tap do |object|
          columns.each_with_index do |column, index|
            object.send("#{column}=", row[index])
          end
        end
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
