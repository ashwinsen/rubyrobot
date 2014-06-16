require_relative 'model/robot_simulator'
require_relative 'command_dispatcher'

class RobotCli

  def initialize(robot_game, commands)
    @robot_game = robot_game
  end

  def cmd command_input
    #Cycle through the chain until a match command is found
    CommandDispatcher.new.execute.each do |regex_to_match, command|
      if command_input =~ regex_to_match
        return command.call(@robot_game, command_input)
      end
    end
  end
end