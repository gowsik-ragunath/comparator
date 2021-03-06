# Comparator

A CSV file comparator which will returns a hash which contains column name as key with a list of missing data as value after comparing both csv files and an array comparator that will return a hash after comparing two or more arrays that are passed as arguments.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'comparator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install comparator

## Usage

```
require "comparator"
```

Now, create an instance for Comparator to compare 2 csv file as

```
comparator = Comparator::CompareCSV.new(to_be_compared_file_path, compared_with_file_path)
```

`to_be_compared_file_path` - first argument should be a file path to get miss match of data comparing with the other csv file.

`compared_with_file_path` - second argument should be a file path of other csv file which will be compared.


**Note: Both file should follow same header names and column data order**

```
Example Format file1.csv:
   Column1,Column2
   a,1
   b,2
   
Example Format file2.csv:
   Column1,Column2
   c,1
   b,50
   
comparator = Comparator::CompareCSV.new(file1.csv, file2.csv)
puts comparator.csv_file_comparator
# {"Column1"=>["a"],"Column2"=>["2"]}
```

Create an instance for Comparator to compare arrays as

```
comparator = Comparator::CompareArray.new
```

and then pass arrays to be compared as arguments to the following method

```
  difference_in_array = comparator.array_comparator([21,32,[43,32,["numbers"]]],["an","array","of","words"],["an","array",["of","and"],"words",[21,32]])
  puts difference_in_array
  # {"difference"=>[43, "numbers"]}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gowsik-ragunath/comparator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Comparator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/comparator/blob/master/CODE_OF_CONDUCT.md).
