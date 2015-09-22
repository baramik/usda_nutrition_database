require 'csv'
require 'benchmark'
require 'active_record'
require 'activerecord-import'

module UsdaNutrientDatabase
  module Import
    class Base
      def initialize(directory)
        @directory = directory
      end

      def import
        log_import_started
        obj_array = []
        file = File.open(file_location, 'r:iso-8859-1:utf-8')
        SmarterCSV.process(file, csv_options) do |chunk|
          chunk.each do |chunk_item|
            obj = build_object(chunk_item)
            obj_array << obj
          end
          class_name = obj_array.first.class.name.constantize
          class_name.transaction do
            obj_array.each(&:save!)
          end
        end
        file.close
      end

      private

      attr_reader :directory

      def build_object(chunk_item)
        find_or_initialize(chunk_item).tap do |object|
          chunk_item.each do |key, value|
            object.send("#{key}=", value)
          end
        end
      end

      def columns
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
        if stripped_row.nil?
          row.to_i
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
