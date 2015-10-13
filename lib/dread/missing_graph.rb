module Dread
  class MissingGraph
    attr_reader :clazz

    def initialize(clazz)
      @clazz = clazz.classify.constantize
    end

    def missing_dependables
      possesionable_associations.map do |assoc_name, assoc_data|
        assoc_name if direct_association_with_no_dependents?(assoc_data)
      end.compact
    end

    private

    def direct_association_with_no_dependents?(assoc_data)
      assoc_data.options[:through].nil? && assoc_data.options[:dependent].nil?
    end

    def possesionable_associations
      has_many_associations.merge(has_one_associations)
    end

    def has_many_associations
      @has_many_associations ||= begin
        clazz.reflections.select do |assoc_name, assoc_data|
          assoc_data.macro == :has_many
        end
      end
    end

    def has_one_associations
      @has_one_associations ||= begin
        clazz.reflections.select do |assoc_name, assoc_data|
          assoc_data.macro == :has_one
        end
      end
    end
  end
end
