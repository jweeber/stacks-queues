# first 6 people hired, not 5
# start with 10 people in queue, assign 1..10

=begin
A company has six hiring positions with more people wanting jobs than the number of available positions.  The company managers decide in order to give more people an opportunity to make money; they will allow people to work in three-month intervals. The first six people on the waiting list will be hired in the order that they are on the waiting list.  The first six people will keep these positions for three months.  At the end of three months, the manager will roll a dice to determine the number of people who will lose their jobs. The company will use the policy of last-hired-first-fired.  For example, if the dice roll is 3, the last 3 people hired will lose their jobs to the first 3 people on the waiting list. People losing their jobs will be placed on the back of the waiting list in the order that they are fired. This process will continue for every three-month interval.
=end


require './Stack.rb'
require './Queue.rb'

class Jobs

  attr_reader :waiting, :workers

  def initialize
    @waiting = get_candidates
    @workers = new_hires

  end

  def fire_then_hire
    num_fired = rand(1..6)
    num_fired.times do
      fired = workers.pop
      waiting.enqueue(fired)
    end
    num_fired.times do
      workers.push(waiting.dequeue)
    end
  end

private
  def get_candidates(num=10)
    number_waiting = Queue.new
    count = 1
    num.times do
      number_waiting.enqueue(count)
      count += 1
    end
    number_waiting
  end

  def new_hires(num=6)
    workers = Stack.new
    num.times do
      workers.push(@waiting.dequeue)
    end
    return workers
  end

end
