require 'colorize'
desc 'list destroyable/deletable dependencies of your ActiveRecord class'
task dread: :environment do
  begin
    dread_graph = Dread::AssociationGraph.new(ENV['class'])
    dread_graph.draw
  rescue Dread::Error => e
    puts e.message.colorize(:red)
  end
end
