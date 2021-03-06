# frozen_string_literal: true

module Topsis
  class CalculateAnswerWeight
    # This is TOPSIS Step 1 algorithm
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    def initialize(normalized_base, supplier_or_material, question)
      @question = question
      @normalized_base = normalized_base
      @supplier_or_material = supplier_or_material
    end

    def execute
      @answer = Answer.find_by(
        about: @supplier_or_material, question_id: @question.id
      )

      if @answer&.option&.value
        { success: true, payload: calculation }
      else
        { success: false, errors: {
          answer: 'there is not an answer for this question'
        } }
      end
    end

    private

    def calculation
      (question_weight * @normalized_base * @answer.option.value)
    end

    def type_of_company
      @supplier_or_material.type_of_company
    end

    def question_weight
      @question.send(:"weight_for_#{type_of_company}_companies")
    end
  end
end
