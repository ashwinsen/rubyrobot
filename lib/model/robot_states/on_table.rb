module RobotOnTableState
  def place(x, y, d)
    'Cannot call place once robot is on table'
  end

  def left
    robot.left
  end

  def right
    robot.right
  end

  def move
    robot.move if valid_move?
  end

  def report
    "#{robot.x_coord},#{robot.y_coord},#{robot.current_direction.to_s}"
  end

  private
  def valid_move?
    tmp_robot = robot.dup
    tmp_robot.move
    tmp_robot.x_coord.between?(0, robot_table.x_max) && tmp_robot.y_coord.between?(0, robot_table.y_max)
  end
end