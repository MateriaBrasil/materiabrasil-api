# frozen_string_literal: true

class CalculateTopsisJob < ApplicationJob
  queue_as :high

  def perform(driver, supplier_or_material)
    questionnaire = Questionnaire.find_by(driver: driver)
    return unless questionnaire.completed_by(supplier_or_material)
    result = Topsis::CalculateDriverPercentage.execute(
      driver, supplier_or_material
    )[:payload]

    update_materials(driver, supplier_or_material, result)
  end

  # rubocop:disable Rails/SkipsModelValidations
  def update_materials(driver, supplier_or_material, result)
    if driver == 'social_human'
      supplier_or_material.materials.update_all(social_driver: result)
    elsif driver == 'management_and_governance'
      supplier_or_material.materials.update_all(management_driver: result)
    elsif driver == 'process'
      supplier_or_material.update(manufacture_driver: result)
    elsif driver == 'raw_material'
      supplier_or_material.update(materiality_driver: result)
    end
  end
  # rubocop:enable Rails/SkipsModelValidations
end
