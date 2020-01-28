def bubble_sort array
  array.each do
    array.each_with_index do |item, index|
      next if index == array.length - 1
      array[index], array[index+1] = array[index+1], array[index] if array[index] > array[index+1]
    end
  end
end