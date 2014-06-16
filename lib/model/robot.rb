require_relative '../../lib/data_structures/circular_list'
class Robot

  attr_accessor :x_coord, :y_coord
  attr_reader :current_direction

  def initialize(x_coord, y_coord, starting_direction)
    @directions = CircularList.new([:N, :E, :S, :W])
    @directions.rotate_to starting_direction
    @x_coord, @y_coord, @current_direction = x_coord, y_coord, starting_direction
  end

  def left
    @current_direction = @directions.fetch_previous
  end

  def right
    @current_direction = @directions.fetch_next
  end

  def move
    case @current_direction
      when :N
        @y_coord = @y_coord + 1
      when :E
        @x_coord = @x_coord + 1
      when :S
        @y_coord = @y_coord - 1
      when :W
        @x_coord = @x_coord - 1
    end
  end
end