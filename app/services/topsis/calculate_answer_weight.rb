# frozen_string_literal: true

module Topsis
  class CalculateAnswerWeight
    # This is TOPSIS Step 1 algorithm
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    def initialize(normalized_base, supplier_material, question)
      @question = question
      @normalized_base = normalized_base
      @supplier_material = supplier_material
    end

    def execute
      @answer = Answer.find_by(
        about: @supplier_material, question_id: @question.id
      )

      if @answer&.option&.value
        { success: true, payload: calculation }
      else
        { success: true, errors: {
          answer: 'there is not an answer for this question'
        } }
      end
    end

    private

    def calculation
      (question_weight * @normalized_base * @answer.option.value).round(3)
    end

    def type_of_company
      if @supplier_material.is_a?(Material)
        @supplier_material.supplier.type_of_company
      else
        @supplier_material.type_of_company
      end
    end

    def question_weight
      @question.send(:"weight_for_#{type_of_company}_companies")
    end
  end
end
