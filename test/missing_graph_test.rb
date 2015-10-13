require 'test_helper'

class Dread::MissingGraphTest < ActiveSupport::TestCase

  test 'initializaties with no problems' do
    assert_nothing_raised do
      Dread::MissingGraph.new('user')
    end
  end

  test 'user class has no missing dependables' do
    missing_dependables = Dread::MissingGraph.new('user').missing_dependables
    assert_equal [], missing_dependables
  end

  test 'account settings class has no missing dependables' do
    missing_dependables = Dread::MissingGraph.new('account_setting').missing_dependables
    assert_equal [], missing_dependables
  end

  test 'can find the model for multiple kinds of notations' do
    %w(account_setting
       AccountSetting).each do |model_name|
      assert_equal AccountSetting, Dread::MissingGraph.new(model_name).clazz
    end
  end

  test 'can find the model for various namespaced clazz names' do
    %w(Wtf::Ashtray
       wtf/ashtray).each do |model_name|
      assert_equal Wtf::Ashtray, Dread::Graph.new(model_name).clazz
    end
  end

  test 'company class has missing dependables on company_organization and headquarter' do
    missing_dependables = Dread::MissingGraph.new('company').missing_dependables
    assert_equal [:company_organizations, :headquarter], missing_dependables
  end
end
