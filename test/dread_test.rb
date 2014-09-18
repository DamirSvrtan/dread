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

  test 'various clazz names' do
    %w(account_setting
       AccountSetting
       account_settings
       AccountSettings).each do |model_name|
      assert_equal AccountSetting, Dread::Graph.new(model_name).clazz
    end
  end

  test 'drawing' do
    dread_graph = Dread::Graph.new('user')
    dread_graph.draw
  end

  test 'collecting' do
    dread_graph = Dread::Graph.new('user')
    dependable_collection = dread_graph.dependable_collection
    dependable_collection.assert_valid_keys(:user)
    dependable_collection[:user].assert_valid_keys(:tweets, :comments, :setting, :avatar)
    dependable_collection[:user][:tweets].assert_valid_keys(:comments, :pictures)
  end

  test 'self-join' do
    dread_graph = Dread::Graph.new('employee')
    dependable_collection = dread_graph.dependable_collection
    dependable_collection.assert_valid_keys(:employee)
    dependable_collection[:employee].assert_valid_keys(:subordinates)
    dependable_collection[:employee][:subordinates].assert_valid_keys('...'.to_sym)
    assert_equal Hash.new, dependable_collection[:employee][:subordinates]['...'.to_sym]
  end

  test 'self-join drawing' do
    dread_graph = Dread::Graph.new('employee')
    dread_graph.draw
  end
end