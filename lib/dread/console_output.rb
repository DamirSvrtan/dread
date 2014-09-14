module Dread
  module ConsoleOutput
    class << self

      INDENT_INCREASE = 4

      def generate(dependable_collection, indent=0)
        dependable_collection.each do |relation_name, dependables|
          indent_string = " " * indent
          puts "#{indent_string}#{relation_name}"
          generate(dependables, indent+INDENT_INCREASE) if dependables.any?
        end
      end

    end
  end
end