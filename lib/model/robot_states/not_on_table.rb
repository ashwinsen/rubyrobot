module RobotNotOnTableState
  def place(x, y, d)
    extend RobotOnTableState
    self.robot = Robot.new x, y, d
  end

  def left
    'Not On Grid, cannot call left command'
  end

  def right
    'Not On Grid, cannot call right command'
  end

  def move
    'Not On Grid, cannot call move command'
  end

  def report
    'Not On Grid'
  end
end