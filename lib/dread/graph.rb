module Dread
  class Error < StandardError;end

  class Graph

    INDENT_INCREASE = 2

    def initialize(clazz_data, indent=0, pluralized=false)
      set_and_verify_clazz(clazz_data)
      @indent = indent
      @pluralized = pluralized
    end

    def draw
      puts " " * indent + clazz_name()

      @clazz.reflections.each do |assoc_name, assoc_data|
        if assoc_data.options[:dependent] == :delete
          puts " "*(indent+INDENT_INCREASE) + "#{assoc_name} [#{assoc_data.table_name.classify}]"
        elsif assoc_data.options[:dependent] == :destroy
          Graph.new(assoc_data, indent + INDENT_INCREASE, assoc_data.macro == :has_many).draw
        end
      end
    end


    private

      attr_reader :indent

      def set_and_verify_clazz(clazz_data)
        clazz_name = ClazzName(clazz_data)
        begin
          @clazz = clazz_name.constantize
        rescue NameError => e
          raise Error.new("Unable to find class called #{clazz_name}")
        end
      end

      def ClazzName(clazz_data)
        case clazz_data
        when ActiveRecord::Reflection::AssociationReflection
          clazz_data.class_name || clazz_data.table_name
        when String
          clazz_data.classify
        when NilClass
          raise Error.new('Please pass a env var called class to proceed.')
        else
          raise Error.new("Unable to proceed with #{clazz_data.class}")
        end
      end

      def clazz_name
        relation = @pluralized ? @clazz.to_s.pluralize : @clazz.to_s
        relation.underscore
      end

  end
end