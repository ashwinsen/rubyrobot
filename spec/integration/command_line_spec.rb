require 'rspec'
require_relative '../../lib/robot_cli'
require_relative '../../lib/model/robot_simulator'
require_relative '../../lib/command_dispatcher'

describe 'Cli' do

  before :each do
    robot_table_new = Table.new(4, 4)
    robot_game_new = RobotSimulator.new(robot_table_new)
    @cli = RobotCli.new(robot_game_new, nil)
  end

  describe 'Table' do
    it 'should not allow you to fall off the table' do
      @cli.cmd('PLACE 0,0,S')
      @cli.cmd('MOVE')
      @cli.cmd('REPORT').should == '0,0,S'
    end

    it 'should not allow you to fall off the table' do
      @cli.cmd('PLACE 4,4,N')
      @cli.cmd('MOVE')
      @cli.cmd('REPORT').should == '4,4,N'
    end
  end

  describe 'Move' do
    it 'allow a valid movement NORTH' do
      @cli.cmd('PLACE 0,0,N')
      @cli.cmd('MOVE')
      @cli.cmd('REPORT').should == '0,1,N'
    end

    it 'allow a valid movement EAST' do
      @cli.cmd('PLACE 0,0,E')
      @cli.cmd('MOVE')
      @cli.cmd('REPORT').should == '1,0,E'
    end

    it 'allow a valid movement SOUTH' do
      @cli.cmd('PLACE 0,1,S')
      @cli.cmd('MOVE')
      @cli.cmd('REPORT').should == '0,0,S'
    end

    it 'allow a valid movement WEST' do
      @cli.cmd('PLACE 1,0,W')
      @cli.cmd('MOVE')
      @cli.cmd('REPORT').should == '0,0,W'
    end
  end

  describe 'Turn' do
    describe 'Right' do
      it 'should allow you to turn right facing W' do
        @cli.cmd('PLACE 1,0,W')
        @cli.cmd('RIGHT')
        @cli.cmd('REPORT').should == '1,0,N'
      end

      it 'should allow you to turn right facing S' do

        @cli.cmd('PLACE 1,0,S')
        @cli.cmd('RIGHT')
        @cli.cmd('REPORT').should == '1,0,W'
      end

      it 'should allow you to turn right facing E' do

        @cli.cmd('PLACE 1,0,E')
        @cli.cmd('RIGHT')
        @cli.cmd('REPORT').should == '1,0,S'
      end

      it 'should allow you to turn right facing N' do

        @cli.cmd('PLACE 1,0,N')
        @cli.cmd('RIGHT')
        @cli.cmd('REPORT').should == '1,0,E'
      end
    end


    describe 'Left' do
      it 'should allow you to turn left facing W' do

        @cli.cmd('PLACE 1,0,W')
        @cli.cmd('LEFT')
        @cli.cmd('REPORT').should == '1,0,S'
      end

      it 'should allow you to turn left facing S' do

        @cli.cmd('PLACE 1,0,S')
        @cli.cmd('LEFT')
        @cli.cmd('REPORT').should == '1,0,E'
      end

      it 'should allow you to turn left facing E' do

        @cli.cmd('PLACE 1,0,E')
        @cli.cmd('LEFT')
        @cli.cmd('REPORT').should == '1,0,N'
      end

      it 'should allow you to turn left facing N' do

        @cli.cmd('PLACE 1,0,N')
        @cli.cmd('LEFT')
        @cli.cmd('REPORT').should == '1,0,W'
      end
    end


  end

  describe 'Placement' do
    describe 'Valid' do
      [
          ['PLACE 0,0,N', '0,0,N'],
          ['PLACE 3,3,N', '3,3,N'],
          ['PLACE 3,1,S', '3,1,S'],
          ['PLACE 4,4,S', '4,4,S'],
          ['PLACE  4,4,S', '4,4,S']
      ].each do |test_case|
        it "allow a valid placement for #{test_case}" do

          @cli.cmd(test_case[0])
          @cli.cmd('REPORT').should == test_case[1]
        end
      end
    end

    describe 'Invalid Move' do
      ['PLACE 5,5,N', 'PLACE 4,6,N', 'PLACE 7,1,S', 'PLACE -4,4,S', 'PLACE 4,-4,S', 'PLACE A,4,S', 'PLACE 4,4,SE'
      ].each do |placement|
        it "should not allow an invalid placement for #{placement}" do

          @cli.cmd(placement)
          @cli.cmd('REPORT').should == 'Not On Grid'
        end
      end
    end
  end
end