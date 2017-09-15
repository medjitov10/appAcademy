# n2

def my_min_1(list)
  result = list.first
  list.each do |el|
    list.each do |el2|
      result = el if el < el2
    end
  end

  result
end

# n
def my_min_2(list)
  result = list.first
  list.each do |el|
    result = el if result > el
  end
  result
end

# n2 + n => O(n2)
def largest_contiguous_subsum(list)
  result = list.first

  subarrays = [] # array of all subarrays
  list[0..-1].each_with_index do |el, i|
    list[i..-1].each_with_index do |el2, j|
      subarrays << list[i..i + j]
    end
  end

  subarrays.each do |subarray|
    sum = subarray.reduce(:+)
    result = sum if result < sum
  end
  result
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list)

def largest_contiguous_subsum_fast(list)
  sum = 0
  best_sum = list.first
  list.each do |el|
    sum+=el
    best_sum = sum if sum > best_sum
    sum = 0 if sum<=0
  end

  best_sum


end
list = [-5, -1, -3]
p  largest_contiguous_subsum(list)
