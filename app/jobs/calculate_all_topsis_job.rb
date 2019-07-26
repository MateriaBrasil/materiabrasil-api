# frozen_string_literal: true

class CalculateAllTopsisJob < ApplicationJob
  queue_as :high

  def perform
    Questionnaire.find_each do |questionnaire|
      if questionnaire.about_type == 'Supplier'
        calculate_each_supplier(questionnaire)
      elsif questionnaire.about_type == 'Material'
        calculate_each_material(questionnaire)
      end
    end
  end

  private

  def calculate_each_supplier(questionnaire)
    Supplier.find_each do |supplier|
      CalculateTopsisJob.perform_later(questionnaire.driver, supplier)
    end
  end

  def calculate_each_material(questionnaire)
    Material.find_each do |material|
      CalculateTopsisJob.perform_later(questionnaire.driver, material)
    end
  end
end
