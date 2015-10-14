require 'colorize'
desc 'list destroyable/deletable dependencies of your ActiveRecord class'
task association_graph: :environment do
  begin
    association_graph = Dread::AssociationGraph.new(ENV['class'])
    association_graph.draw
  rescue Dread::Error => e
    puts e.message.colorize(:red)
  end
end

desc 'list ActiveRecord relationships with missing dependent destroys/deletes..'
task missing_dependables: :environment do
  Dread::MissingGraphs.new.draw
end
