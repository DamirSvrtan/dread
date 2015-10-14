module Dread
  class MissingGraphs

    def initialize
      Rails.application.eager_load!
    end

    def all_missing_dependables
      Dread.ar_models.map do |active_record_model|
        missing_dependables = Dread::MissingGraph.new(active_record_model.to_s)
                                                 .missing_dependables

        { active_record_model => missing_dependables } if missing_dependables.any?
      end.compact.inject {|element, all| all.merge(element)}
    end

    def draw
      ConsoleOutput.generate_missing(all_missing_dependables)
    end
  end
end
