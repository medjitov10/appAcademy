require 'byebug'
def range_recursive(first,last)
  return [last-1] if first == last-1
  arr = [first].concat(range_recursive(first + 1, last))
end

def range_iterative(first,last)
  arr = []
  (first...last).each {|element| arr << element}
  arr
end

def recursion_one (base, power)
  return 1 if power == 0
  base * recursion_one(base, power - 1)
end

def recursion_two (base, power)
  # debugger
  return 1 if power == 0
  return base if power == 1
  return recursion_two(base, power/2) ** 2 if (power % 2) == 0
  return base * (recursion_two(base, (power - 1) / 2) ** 2) if (power % 2 )!= 0

end



class Array

  def deep_dup
    return [] if length==0
    self.each do |el|
      el.is_a?(Array) ? el.deep_dup : el
    end
  end


end

def fibon_recursive (n)
  return [0,1].take(n) if n <= 2
  v = fibon_recursive(n-1)
  v.push(v[-1] + v[-2])
end

def fibon_iterative (n)
  arr = [0,1]
  return [] if n == 0
  return [0] if n == 1
  return arr if n == 2

  (2...n).each do |i|
    arr.push(arr[-1] + arr[-2])
  end
  arr
end

def subsets (arr)
  return [[]] if arr.length == 0
  var = subsets(arr.take(arr.length-1))
  var.concat(var.map do |sub|
    sub+[arr.last]
  end )
end
# took it from solution
def permutations(array)#1) [1, 2, 3] 2)[2,3]  3) [3]
  return [array] if array.length <= 1



  first = array.shift # 1) 1   2) 2
  # array 1) [2,3]  2) [3]

  perms = permutations(array) #1)   2)[[2,3], [3,2]]    3) [[3]]

  total_permutations = []

  perms.each do |perm| # 3) perm= [3] 2) perm = [2,3] and [3,2]
    (0..perm.length).each do |ei| #3) 0,1 2) 2

      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
      #total_permutations << [[1, 2,3] [2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]


    end
  end
  total_permutations
end

def swap(arr,a,b)
  arr[a],arr[b]=arr[b],arr[a]
  arr
end

def permutations_own(array)

  result=[]
  tmp_arr = array.dup
  i=0
  while i < array.length
      tmp_arr = array.dup

      result << swap(tmp_arr,0,i)
    i+=1
  end

  result2=[]
  i=0
  while result.length > i
    j=i
    tmp_arr=result[i]
    while j < result[i].length
      result2 << swap(tmp_arr,i,j)
      p "#{i}#{j}"
      j+=1
    end
    i+=1
  end
  result2
end
