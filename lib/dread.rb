require 'pry'
require 'dread/association_graph'
require 'dread/missing_graph'
require 'dread/missing_graphs'


module Dread
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'tasks/dread.rake')
    end
  end

  def self.ar_models
    ActiveRecord::Base.descendants
  end
end
