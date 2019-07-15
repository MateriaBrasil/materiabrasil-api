# frozen_string_literal: true

module Topsis
  class CalculateAnswerWeight
    # This is TOPSIS Step 1 algorithm
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    def initialize(normalized_base, supplier_material, question)
      @normalized_base = normalized_base
      @supplier_material = supplier_material
      @question = question
      @answer = Answer.find_by(
        about: supplier_material, question_id: question.id
      )
    end

    def execute
      (question_weight * @normalized_base * @answer.option.value).round(3)
    end

    private

    def type_of_company
      if @supplier_material.is_a?(Material)
        @supplier_material.supplier.type_of_company
      else
        @supplier_material.type_of_company
      end
    end

    def question_weight
      if type_of_company == 1
        @question.weight_for_small_companies
      elsif type_of_company == 2
        @question.weight_for_medium_companies
      elsif type_of_company == 3
        @question.weight_for_large_companies
      elsif type_of_company == 4
        @question.weight_for_service_companies
      end
    end
  end
end
