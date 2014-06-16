require_relative 'robot_states/not_on_table'
require_relative 'robot_states/on_table'
require_relative 'robot'
require_relative 'table'

class RobotSimulator
  include RobotNotOnTableState
  attr_accessor :robot, :robot_table

  def initialize(robot_table)
    @robot_table = robot_table
    @robot = nil
  end
end