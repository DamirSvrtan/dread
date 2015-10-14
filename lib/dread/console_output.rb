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

      def generate_missing(klasses_with_missing_dependables)
        klasses_with_missing_dependables.each do |klass, missing_dependables|
          puts klass
          missing_dependables.each do |missing_dependable|
            puts "  #{missing_dependable}"
          end
        end
      end

    end
  end
end
