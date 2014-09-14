require 'dread/error'
require 'dread/console_output'
module Dread
  class Graph

    attr_reader :clazz, :dependable_collection

    def initialize(clazz_data, pluralized=false)
      set_and_verify_clazz(clazz_data)
      @pluralized = pluralized
    end

    # { user: { tweets: { comments: {} }, comments: {}, account_setting: {} } }
    def dependable_collection
      @dependable_collection ||= Hash.new.tap do |relation_hash|
        @clazz.reflections.each do |assoc_name, assoc_data|
          if assoc_data.options[:dependent] == :delete
            relation_hash[assoc_name] = {}
          elsif assoc_data.options[:dependent] == :destroy
            relation_hash[assoc_name] =
              Graph.new(assoc_data, assoc_data.macro == :has_many).dependable_collection
          end
        end
      end
    end

    def draw(output='console_output')
      case output
      when 'console_output'
        ConsoleOutput.generate(dependable_collection)
      end
    end

    private

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

      def relation_name
        relation = @pluralized ? @clazz.to_s.pluralize : @clazz.to_s
        relation.underscore
      end

  end
end