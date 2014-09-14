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
    dependable_collection[:user].assert_valid_keys(:tweets, :comments, :setting)
    dependable_collection[:user][:tweets].assert_valid_keys(:comments)
  end

end