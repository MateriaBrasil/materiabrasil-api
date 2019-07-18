# frozen_string_literal: true

module Topsis
  class MinMaxDistances
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    def initialize(answer, type_of_company)
      @answer = answer
      @question = answer.question
      @supplier_material = @answer.about
      @type_of_company = type_of_company
    end

    def execute
      positive = ((scenarios[:max] - answer_weight)**2)
      negative = ((scenarios[:min] - answer_weight)**2)
      { success: true, payload: { positive: positive, negative: negative } }
    end

    private

    def normalized_base
      Topsis::NormalizeBaseForQuestionnaire.execute(
        @question.questionnaire.driver, @type_of_company
      )[:payload]
    end

    def answer_weight
      Topsis::CalculateAnswerWeight.execute(
        normalized_base, @supplier_material, @question
      )[:payload]
    end

    def scenarios
      Topsis::MinMaxScenarios.execute(
        @question, @type_of_company
      )[:payload]
    end
  end
end
