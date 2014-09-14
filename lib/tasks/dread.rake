task dread: :environment do
  begin
    dread_graph = Dread::Graph.new(ENV['class'])
    dread_graph.draw
  rescue Dread::Error => e
    puts e.message
  end
end