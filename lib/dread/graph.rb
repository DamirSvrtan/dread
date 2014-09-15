require 'dread/error'
require 'dread/console_output'
module Dread
  class Graph

    attr_reader :clazz, :dependable_collection

    def initialize(clazz_data, pluralized=false)
      set_and_verify_clazz_and_relation(clazz_data)
      @pluralized = pluralized
      @@tracker ||= []
    end

    # { user: { tweets: { comments: {} }, comments: {}, setting: {} } }
    def dependable_collection
      @dependable_collection ||=
          { @relation.to_sym => collect_dependables }
    end

    def draw(output='console_output')
      case output
      when 'console_output'
        ConsoleOutput.generate(dependable_collection)
      end
    end

    private

      def track!(reflection)
        @@tracker << reflection
      end

      def tracked?(reflection)
        @@tracker.include? reflection
      end

      def set_and_verify_clazz_and_relation(clazz_data)
        begin
          set_clazz_and_relation(clazz_data)
        rescue NameError => e
          raise Error.new("Unable to find class called #{clazz_data.classify}")
        end
      end

      def set_clazz_and_relation(clazz_data)
        case clazz_data
        when ActiveRecord::Reflection::AssociationReflection
          @clazz = (clazz_data.class_name || clazz_data.table_name).constantize
          @relation = clazz_data.name
        when String
          @clazz = (clazz_data.classify).constantize
          @relation = clazz_data
        when NilClass
          raise Error.new('Please pass a env var called class to proceed. E.g: rake dread class=user')
        else
          raise Error.new("Unable to proceed with #{clazz_data.class}")
        end
      end

      def collect_dependables
        Hash.new.tap do |relation_hash|
          @clazz.reflections.each do |assoc_name, assoc_data|
            case assoc_data.options[:dependent]
            when :delete
              relation_hash[assoc_name] = {}
            when :destroy
              unless tracked?(assoc_data)
                track!(assoc_data)
                relation_hash.merge!(
                  Graph.new(assoc_data, assoc_data.macro == :has_many).dependable_collection)
              end
            end
          end
        end
      end

  end
end