require 'test_helper'

class DreadTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Dread
  end

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
end