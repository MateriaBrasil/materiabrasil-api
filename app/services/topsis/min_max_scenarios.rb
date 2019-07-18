# frozen_string_literal: true

module Topsis
  class MinMaxScenarios
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    def initialize(question, type_of_company)
      @question = question
      @type_of_company = type_of_company
    end

    def execute
      normalized_question_weight = normalized_base * question_weight
      best_scenario = (normalized_question_weight * 5)
      worst_scenario = (normalized_question_weight * 1)

      { success: true, payload: { min: worst_scenario, max: best_scenario } }
    end

    private

    def normalized_base
      Topsis::NormalizeBaseForQuestionnaire.execute(
        @question.questionnaire.driver, @type_of_company
      )[:payload]
    end

    def question_weight
      @question.send(:"weight_for_#{@type_of_company}_companies")
    end
  end
end
