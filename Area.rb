class Rectangle
  attr_reader :height, :width

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
  attr_reader :height, :base

  def initialize(height, base)
    @height = height
    @base = base
  end

  def area
    @height * @base / 2
  end
end

class Circle
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius * @radius
  end
end

class CustomShape
  attr_reader :area

  def initialize(area)
    @area = area
  end

  def area
    @area
  end
end

shapes = [Square.new(5), Rectangle.new(3, 8), Triangle.new(4, 8), Circle.new(3), CustomShape.new(24.5)]
sorted = shapes.sort {|a, b| a.area <=> b.area}
p sorted
p sorted.map{|figure| figure.area}