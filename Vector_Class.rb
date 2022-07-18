class Vector
  attr_accessor :vector

  def initialize(vector)
    @vector = vector
  end

  def [](index)
    vector[index]
  end

  def add(other)
    if vector.size != other.vector.size
      nil
    else
      vector.each_with_index.map { |elem, i| elem + other.vector[i] }
    end
  end

  def subtract(other)
    if vector.size != other.vector.size
      nil
    else
      vector.each_with_index.map { |elem, i| elem - other.vector[i] }
    end
  end

  def dot(other)
    if vector.size != other.vector.size
      nil
    else
      res = vector.each_with_index.map { |elem, i| elem * other.vector[i]}
      res.inject(:+)
    end
  end

  def norm
    res = 0
    vector.each{ |elem| res += elem ** 2 }
    Math.sqrt(res)
  end

  def to_s
    '(' + vector.join(', ') + ')'
  end

end

a = Vector.new([1, 2, 3])
b = Vector.new([3, 4, 5])
c = Vector.new([5, 6, 7, 8])

p a.add(b)      # should return a new Vector([4, 6, 8])
p a.subtract(b) # should return a new Vector([-2, -2, -2])
p a.dot(b)      # should return 1*3 + 2*4 + 3*5 = 26
p a.norm()      # should return sqrt(1^2 + 2^2 + 3^2) = sqrt(14)
p a.add(c)      # throws an nil
p a.to_s        # (1, 2, 3)