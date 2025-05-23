module Enumerable
  # Your code goes here
  def my_all?(&blk)
    # check if there any nil in array
    nil_count = 0
    self.each { |el| nil_count += 1 if el.nil? }

    if block_given? && nil_count <= 0
      # False unless all elements pass
      self.each do |el|
        return false if blk.call(el) == false
      end
      true
    # false if there is more than 1 nil element
    else
      return false if nil_count > 0

      # true because all the elements are truthy value
      true

    end
  end

  def my_any?(&blk)
    self.each do |el|
      # return true if block retun true
      return true if blk.call(el) == true
    end
    false
  end

  def my_count(&blk)
    count = 0

    if block_given?
      self.each do |el|
        # +1 to count if block returns true
        count += 1 if blk.call(el) == true
      end
    else
      # if there is no block count the number of elements
      self.each { count += 1 }
    end

    count
  end

  def my_each_with_index(&blk)
    count = 0
    while count < self.size
      # pass the count variable as index
      blk.call(self[count], count)
      count += 1
    end
    self
  end

  # set initial value to 0 unless specified otherwised
  def my_inject(initial_value = 0, &blk)

    sum = initial_value
    
    self.each do |el|
      # adding values from block back to sum.
      sum = blk.call(sum, el)
    end

    sum
  end

  def my_map(&blk)
    collect = []
    self.each do |el|
      # add the element returned from block to collect
      collect << blk.call(el)
    end
    collect
  end

  def my_none?(&blk)
    self.each do |el|
      return false if blk.call(el) == true
    end

    true
  end

  def my_select(&blk)
    collect = []
    self.each do |el|
      # add the el to block if block returns true
      collect << el if blk.call(el) == true
    end

    collect
  end

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&blk)
    count = 0
    while count < self.size
      blk.call(self[count])
      count += 1
    end
    self
  end
end
