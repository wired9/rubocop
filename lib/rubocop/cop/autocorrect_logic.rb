# encoding: utf-8

module RuboCop
  module Cop
    # This module encapsulates the logic for autocorrect behaviour for a cop
    module AutocorrectLogic
      def autocorrect?
        @options[:auto_correct] && support_autocorrect? && autocorrect_enabled?
      end

      def support_autocorrect?
        respond_to?(:autocorrect, true)
      end

      def autocorrect_enabled?
        # allow turning off autocorrect on a cop by cop basis
        return true unless cop_config
        cop_config['AutoCorrect'] != 'False'
      end
    end
  end
end
