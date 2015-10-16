require 'csv'
require 'benchmark'
require 'active_record'
require 'activerecord-import'
require 'upsert/active_record_upsert'

module UsdaNutrientDatabase
  module Import
    class Base
      def initialize(directory)
        @directory = directory
      end

      def import
        log_import_started
        file = File.open(file_location, 'r:iso-8859-1:utf-8')
        SmarterCSV.process(file, csv_options) do |chunk|
          chunk.each do |chunk_item|
            # byebug
            additional_values = additional_import_values(chunk_item)
            array_to_transform = [additional_values, chunk_item]
            transformed_to_hash_array = array_to_transform.reduce(&:merge)
            final_hash = transformed_to_hash_array.reject do |key, value|
              value.blank?
            end
            import_class.upsert(final_hash)
          end
        end
        file.close
      end
      private

      attr_reader :directory

      def modified_chunk_item(chunk_item)
        chunk_item
      end

      def additional_import_values(chunk_item)
        {}
      end

      def columns
        raise NotImplementedError
      end

      def import_class
        raise NotImplementedError
      end

      def find_or_initialize(row)
        raise NotImplementedError
      end


      def file_location
        "#{directory}/#{filename}"
      end

      def filename
        raise NotImplementedError
      end

      def strip_leading_zeros_from_keys(row)
        stripped_row = row.sub(/^0+/, '')
        case stripped_row
          when nil
            row.to_i
          when ''
            row
          else
            stripped_row.to_i
        end
      end

      def csv_options
        { col_sep: '^',
          quote_char: '~',
          chunk_size: 10000,
          user_provided_headers: columns,
          headers_in_file: false,
          convert_values_to_numeric: false,
          remove_empty_values: false
        }
      end
    end
  end
end
