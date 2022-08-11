class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length)
    super(length, length)
  end
end

class Triangle
  def initialize(height, base)
    @height = height
    @base = base
  end

  def area
    @height * @base / 2
  end
end

class Circle
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius * @radius
  end
end

class CustomShape
  def initialize(area)
    @area = area
  end

  def area
    @area
  end
end

def <=>(other_shape)
  self.area <=> other_shape.area
end

shapes = [Square.new(5), Rectangle.new(3, 8), Triangle.new(4, 8), Circle.new(3), CustomShape.new(24.5)]

puts shapes.sort
#puts shapes.sort.map {|figure| figure.area}