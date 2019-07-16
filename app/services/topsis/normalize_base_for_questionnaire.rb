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
      @questionnaire_driver = questionnaire_driver
      @type_of_company = type_of_company
    end

    def execute
      if questionnaire.blank?
        { success: false, errors: { questionnaire: 'Questionnaire not found' } }
      else
        { success: true, payload: (
          1.0 / questions.sum(:"weight_for_#{@type_of_company}_companies")
        ) }
      end
    end

    private

    def questionnaire
      Questionnaire.find_by(driver: @questionnaire_driver)
    end

    def questions
      questionnaire.questions
    end
  end
end
