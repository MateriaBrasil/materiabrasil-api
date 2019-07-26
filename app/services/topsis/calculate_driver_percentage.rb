# frozen_string_literal: true

module Topsis
  class CalculateDriverPercentage
    def self.execute(*args, &block)
      new(*args, &block).execute
    end

    def initialize(driver, supplier_or_material)
      @supplier_or_material = supplier_or_material
      @driver = driver
      @negative_sum = 0
      @positive_sum = 0
    end

    def execute
      @supplier_or_material.answers.not_zero.by_driver(@driver).each do |answer|
        distances = Topsis::MinMaxDistances.execute(answer, type_of_company)
        @negative_sum += distances[:payload][:negative]
        @positive_sum += distances[:payload][:positive]
      end

      percentage = (@negative_sum / (@negative_sum + @positive_sum)) * 100.0

      { success: true, payload: percentage.round }
    end

    private

    def type_of_company
      @supplier_or_material.type_of_company
    end
  end
end
