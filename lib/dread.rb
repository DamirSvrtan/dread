require 'pry'
require 'dread/graph'
require 'dread/missing_graph'

module Dread
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'tasks/dread.rake')
    end
  end
end
