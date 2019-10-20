require 'comparator'
begin
  init_comp = Comparator::CompareCSV.new("/Users/gowsik/Desktop/gowsik/comparator_test/mall.csv","/Users/gowsik/Desktop/gowsik/comparator_test/sell.csv")
  p init_comp.csv_file_comparator
rescue Exception => e
  p e.message
end