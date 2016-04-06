class Stack
  def initialize
    @store = Array.new
  end

  def pop
    @store.pop
  end

  def push(element)
    @store << element
  end

  def size
    @store.size
    # or @store.length
  end

  def empty?
    size == 0
    # @store.empty? also returns true/false
  end

end
