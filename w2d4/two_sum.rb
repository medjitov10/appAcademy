def brute_two_sum?(arr, target)
  result = []

  arr.each.with_index do |el1, i|
    arr.each.with_index do |el2, j|
      result << el1 + el2 if i != j
    end
  end
  result.include?(target)
end

# arr = [0, 1, 5, 7]
# p brute_two_sum?(arr, 6) # => should be true
# p brute_two_sum?(arr, 10)

def sort_two_sum?(arr, target)

  sorted_arr = arr.sort
  j = arr.length-1
  i=0
  until i == j
    case sorted_arr[i] + sorted_arr[j] <=> target
    when 1
      j-=1
    when 0
      return true
    when -1
      i+=1
    end
  end
  false
end




arr = [0, 1, 5, 7]
p sort_two_sum?(arr, 5) == true
p sort_two_sum?(arr, 10) == false
p sort_two_sum?(arr, 1)  == true
p sort_two_sum?(arr, 0) == false








def hash_two_sum?(arr, target)
  hash = Hash.new { |hash, key| hash[key] = false }

  arr.each do |el|
    return true if hash[el]
    hash[target - el] = true
  end
  false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 5) == true
p hash_two_sum?(arr, 10) == false
p hash_two_sum?(arr, 1)  == true
p hash_two_sum?(arr, 0) == false



def hash_four_sum?(arr, target)
  hash = Hash.new { |hash, key| hash[key] = false }

  arr.each do |el|
    return true if hash[el]
    hash[target - el] = true
  end
  false
end
