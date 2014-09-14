module Dread
  class Error < StandardError;end

  class Graph

    INDENT_INCREASE = 2

    attr_reader :clazz, :indent, :pluralized

    def initialize(clazz, indent=0, pluralized=false)
      set_and_verify_clazz(clazz)
      @indent = indent
      @pluralized = pluralized
    end

    def draw
      puts " " * indent + clazz_name()

      @clazz.reflections.each do |assoc_name, assoc_data|
        if assoc_data.options[:dependent] == :delete
          puts " "*(indent+INDENT_INCREASE) + "#{assoc_name} [#{assoc_data.table_name.classify}]"
        elsif assoc_data.options[:dependent] == :destroy
          association_clazz = assoc_data.class_name || assoc_data.table_name
          Graph.new(association_clazz, indent + INDENT_INCREASE, pluralized = true).draw
        end
      end
    end


    private

      def set_and_verify_clazz(clazz)
        raise Error.new('Please pass a env var called class to proceed.') if clazz.nil?
        begin
          @clazz = clazz.classify.constantize
        rescue NameError => e
          raise Error.new("Unable to find class called #{clazz.classify}")
        end
      end

      def clazz_name
        relation = @pluralized ? @clazz.to_s.pluralize : @clazz.to_s
        relation.underscore
      end

  end
end