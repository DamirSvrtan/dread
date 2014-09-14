require 'test_helper'

class DreadTest < ActiveSupport::TestCase
  test 'initialization' do
    assert_nothing_raised do
      dread_graph = Dread::Graph.new('user')
    end
  end

  test 'initialization with missing constant' do
    assert_raises Dread::Error do
      dread_graph = Dread::Graph.new('uzer')
    end
  end

  test 'drawing' do
    dread_graph = Dread::Graph.new('user')
    dread_graph.draw
  end

  test 'collecting' do
    dread_graph = Dread::Graph.new('user')
    binding.pry
  end
end