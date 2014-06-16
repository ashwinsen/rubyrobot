class Table
  attr_reader :x_max, :y_max
  def initialize(x_coord, y_coord)
    @x_max, @y_max = x_coord, y_coord
  end
end
