class Array
  def my_each
    i = 0
    while i < length
    yield(self[i])
      i += 1
    end
    self
  end

  def my_select
    i = 0
    result = []
    while i < length
      if yield self[i]
        result << self[i]
      end
      i+=1
    end
    result
  end

  def my_reject
    i = 0
    result = []
    while i < length
      unless yield self[i]
        result << self[i]
      end
      i+=1
    end
    result
  end

  def my_any?
    i = 0
    while i < length
      if yield self[i]
        return true
      end
      i+=1
    end
    false
  end

  def my_all?
    i = 0
    while i < length
      if yield(self[i]) == false
        return false
      end
      i += 1
    end
    true
  end

  def my_flatten
    i = 0
    result =[]

    while i < length
      if self[i].is_a? Array
         result.concat(self[i].my_flatten)
      else
         result << self[i]
      end
      i += 1
    end

    result
  end

  def my_zip(*args)
    result = []
    i = 0
    while i < length
      temp = []
      temp << self[i]
      args.each { |arg| temp << arg[i] }
      result << temp
      i += 1
    end
    result
  end

  def my_rotate(n=1)
    i = 0
    result = []
    while i < length
      result << self[(i + n) % length]
      i += 1
    end
    result
  end

  def my_join(sep = "")
    result = "#{self[0]}"
    self[1..-1].my_each{|el| result << "#{sep}#{el}"}
    result
  end

  def my_reverse
    result = []
    i = length - 1
    while i>=0
      result << self[i]
      i-=1;
    end
    result

  end

  def bubble_sort!(&prc)
    prc ||= Proc.new{|num1, num2| num1 <=> num2}
    sorted = false
    until sorted

      sorted = true
      i = 0
      while i < length - 1
        if prc.call(self[i],self[i+1]) > 0
          self[i],self[i+1] = self[i+1],self[i]
          sorted = false
        end
        i+=1
      end
    end
    self
  end


end


def factors(num)
  result = []
  num.downto(1) do |el|
    result << el if num%el == 0
  end
  result.sort
end

def substrings(str)
  i = 0
  result = []
  while i < str.length
    j = i
    while j < str.length
      result << str[i..j]
      j += 1
    end
    i += 1
  end
  result
end

def subwords(string, dictionary)
  substrings(string).select { |word| dictionary.include?(word) }
end


#[1, 2, 3].my_each { |n| puts n }
