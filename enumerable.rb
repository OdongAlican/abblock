module Enumerable
  def my_each &block
    if block
      for i in self do
        yield i
      end
    else
      return self.to_enum :my_each
    end
    self
  end

  def my_each_with_index &block
    if block
      contador = 0
      for i in self do
        yield i, contador
        contador += 1
      end
    else
      return self.to_enum :my_each_with_index
    end
    self
  end

  def my_select &block
    if block
      my_array = []
      self.my_each {|x| my_array.push x if yield x}
    else
      return self.to_enum :my_select
    end
    my_array
  end

  def my_all? &block
    boolean = true
    if block
      self.my_each do |x|
        boolean = yield x
        break if boolean == false
      end
    end
    boolean = boolean ? true : false
  end

  def my_any? &block
    boolean = true
    if block
      self.my_each do |x|
        boolean = yield x
        break if boolean == true
      end
    end
    boolean = boolean ? true : false
  end

  def my_none? &block
    boolean = true
    if block
      self.my_each do |x|
        boolean = yield x
        break if boolean == true
      end
    end
    boolean = boolean ? false : true
  end

  def my_count
    count = 0
    self.my_each { count += 1 }
    count
  end

  def my_map proc=false
    array = []
    if proc
      self.my_each { |x| array.push(proc.call x) }
    else
      self.my_each { |x| array.push(yield x) }
    end
    array
  end

  def my_inject #incompleto
    my_array = [self.first]
    self.my_each_with_index do |x, i|
      next if i == 0
      my_array.push yield(my_array.last, x)
    end
    my_array.last
  end

  def multiply_els
    self.my_inject { |prod, n| prod * n }
  end
end

class Object
  def boolean?
    self.is_a?(TrueClass) || self.is_a?(FalseClass)
  end
end

