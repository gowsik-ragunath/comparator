require 'csv'

module Comparator
  class CompareCSV

    class CSVInitializeError < StandardError
      def message
        "For now you can only compare 2 files"
      end
    end

    class CSVHeaderMissMatchError < StandardError
      def message
        "Header of two csv files doesn't match"
      end
    end

    def initialize(*args)
      if args.length == 2
        @file_name = args
      else
        raise CSVInitializeError
      end
    end

    def does_it_work?
      true
    end

    def file_encoder(file_path)
      # reference: https://stackoverflow.com/questions/5163339/write-and-read-a-file-with-utf-8-encoding
      options = { headers: true }.freeze
      encode_file = File.open(file_path, "r:UTF-8")
      CSV.parse(encode_file, options)
    end

    def csv_file_comparator
      fixed_file = file_encoder(@file_name[0])
      comparing_file = file_encoder(@file_name[1])
      difference_hash = {}

      fixed_file_header = fixed_file.headers
      comparing_file_header = comparing_file.headers

      fixed_file_column = fixed_file.by_col
      comparing_file_column = comparing_file.by_col

      # check if both file has the same header
      if fixed_file_header.sort == comparing_file_header.sort
        # ensure header and column of both file are not swapped
        zip_index = 0
        fixed_file_column.zip(comparing_file_column).each do |fixed_column_data, compare_column_data|
          difference_hash[fixed_file_header[zip_index]] = fixed_column_data[1].difference(compare_column_data[1])
          zip_index += 1
        end
      else
        raise CSVHeaderMissMatchError
      end
      difference_hash
    end
  end
end