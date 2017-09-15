def windowed_max_range(arr, window_size)
  ranges = []
  arr[0..-window_size].each_index do |i|
    ranges << arr[i...window_size+i].max - arr[i...window_size+i].min
  end
   ranges.max
end
p windowed_max_range([1, 0, 2, 5, 4, 8], 2)


class My_queue
  def initialize
    @store = []
  end

  def add(thing)
    @store << thing
  end

  def remove(thing)
    @store.shift
  end

  def size
    @store.length
  end
  def peek
    @store.first
  end
  def empty?
    size == 0
  end
end

class My_stack
  def initialize
    @store = []
  end

  def add(thing)
    @store.unshift(thing)
  end

  def remove(thing)
    @store.shift(thing)
  end

  def peek
    @store.first
  end

  def empty?
    size == 0
  end
  def size
    @store.length
  end
end


class Stack_queue

  def initialize
    @stack_queue = Stack.new
  end

  



end
