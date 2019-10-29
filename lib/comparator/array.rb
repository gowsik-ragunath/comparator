module Comparator
  class CompareArray

    class ArrayInitializeError < StandardError
      def message
        "Pass more than one array"
      end
    end

    def does_it_work?
      true
    end

    def array_comparator(*args)
      if args.length > 1
        difference_hash = {}
        evaluation_array = args[0..-2].flatten
        compare_array = args.last.flatten
        difference_hash["difference"] = evaluation_array.difference(compare_array)
      else
        raise ArrayInitializeError
      end
      difference_hash
    end
  end
end