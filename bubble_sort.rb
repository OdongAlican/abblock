#!/usr/bin/ruby
def bubble_sort array
  array.each do
    array.each_with_index do |item, index|
      next if index == array.length - 1
      array[index], array[index+1] = array[index+1], array[index] if array[index] > array[index+1]
    end
  end
end

bubble_sort [2,0,3,9,5]