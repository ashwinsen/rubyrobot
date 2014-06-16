class CommandDispatcher

  HELP_MESSAGE          = '
          Valid commands:

          PLACE <0-4>,<04>,<N|S|E|W>
          i.e. PLACE 1,1,W

          MOVE
          LEFT
          RIGHT
          HELP
          REPORT
          EXIT
'


  VALID_PLACEMENT_REGEX = /^PLACE\s*([0-4])\s*,\s*([0-4])\s*,\s*([S|N|E|W])$/


  def execute
  #Chain of responsibility
    {
        /^\s*REPORT\s*$/      => lambda { |robot_game, _| robot_game.report },
        VALID_PLACEMENT_REGEX => lambda { |robot_game, cmd|
          match = cmd.match(VALID_PLACEMENT_REGEX)
          robot_game.place(match[1].to_i, match[2].to_i, match[3].to_sym)
        },
        /^\s*LEFT\s*$/        => lambda { |robot_game, _| robot_game.left },
        /^\s*RIGHT\s*$/       => lambda { |robot_game, _| robot_game.right },
        /^\s*MOVE\s*$/        => lambda { |robot_game, _| robot_game.move },
        /^\s*HELP\s*$/        => lambda { |_, _| HELP_MESSAGE },
        /^\s*EXIT\s*$/        => lambda { |_, _| exit 0 },
        /^.*$/                => lambda { |_, _| HELP_MESSAGE },
    }
  end

end