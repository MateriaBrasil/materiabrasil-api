# frozen_string_literal: true

module Topsis
  class NormalizeBaseForQuestionnaire
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    # This method will return a normalized value for a
    # specific questionnaire and company type/size
    # and will return "1 / SUM of questions weights"
    # Example: "1/37 = 0.027027027"
    # This value will be used on the next steps of Topsis

    def initialize(questionnaire_driver, type_of_company)
      @questionnaire = Questionnaire.find_by(driver: questionnaire_driver)
      @questions = @questionnaire.questions
      @type_of_company = type_of_company
    end

    def execute
      if @type_of_company == 1
        (1.0 / @questions.sum(:weight_for_small_companies))
      elsif @type_of_company == 2
        (1.0 / @questions.sum(:weight_for_medium_companies))
      elsif @type_of_company == 3
        (1.0 / @questions.sum(:weight_for_large_companies))
      elsif @type_of_company == 4
        (1.0 / @questions.sum(:weight_for_service_companies))
      end
    end
  end
end
