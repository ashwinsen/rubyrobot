require 'rspec'
require_relative '../../../lib/data_structures/circular_list'

describe 'Circular List' do

  it 'should rotate forward' do
    c = CircularList.new([1,2,3,4])
    c.fetch_next.should == 2
    c.fetch_next.should == 3
    c.fetch_next.should == 4
    c.fetch_next.should == 1
  end

  it 'should rotate backwards' do
    c = CircularList.new([1,2,3,4])
    c.fetch_previous.should == 4
    c.fetch_previous.should == 3
    c.fetch_previous.should == 2
    c.fetch_previous.should == 1
    c.fetch_previous.should == 4
  end

  it 'should rotate to a specified object (1)' do
    c = CircularList.new([?A,?B,?C,?D])
    c.rotate_to ?C
    c.fetch_next.should == ?D
  end

  it 'should rotate to a specified object (2)' do
    c = CircularList.new(%w[cat dog horse cow pig sheep])
    c.rotate_to 'horse'
    c.fetch_next.should == 'cow'
    c.rotate_to 'cat'
    c.fetch_next.should == 'dog'
  end

  it 'should not if specified object not found' do
    c = CircularList.new(%w[cat dog horse cow pig sheep])
    c.rotate_to('penguin').should == nil
    c.fetch_next.should == 'dog'
  end

end