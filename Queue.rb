# FIFO

class Queue

  def initialize
    @store = Array.new
  end

  # take out
  def dequeue
    # pop removes last element, but we put them in as the first element each time, so the last element is always the first one that was put in
    @store.pop
  end

  # put in
  def enqueue(element)
    @store.unshift(element)
  end

  def size
    @store.size
  end

  def empty?
    size == 0
  end
end
