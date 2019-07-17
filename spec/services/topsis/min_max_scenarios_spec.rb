# frozen_string_literal: true

require 'rails_helper'

describe Topsis::MinMaxScenarios do
  before do
    ['gestao_e_governanca_seeds.rb',
     'humano_social_seeds.rb',
     'materia_prima_seeds.rb',
     'processo_seeds.rb',
     'supplier_answer_seeds.rb'].each do |seed_file|
      load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
    end
  end

  let(:all_scenario_weights) do
    best_values = []
    worst_values = []
    questionnaire.questions.order(sorting: :asc).each do |question|
      calculation = described_class.execute(
        question, supplier.type_of_company
      )[:payload]

      best_values << calculation[:max]
      worst_values << calculation[:min]
    end

    { min: worst_values, max: best_values }
  end

  describe 'when questionnaire is social_human' do
    let(:questionnaire) do
      Questionnaire.find_by(driver: 'social_human')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:best_scenario_values) do
        [0.135, 0.135, 0.270, 0.405, 0.135, 0.405, 0.405, 0.270, 0.135, 0.405,
         0.270, 0.405, 0.405, 0.135, 0.270, 0.405, 0.405]
      end

      let(:worst_scenario_values) do
        [0.027, 0.027, 0.054, 0.081, 0.027, 0.081, 0.081, 0.054, 0.027, 0.081,
         0.054, 0.081, 0.081, 0.027, 0.054, 0.081, 0.081]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:best_scenario_values) do
        [0.111, 0.111, 0.333, 0.333, 0.333, 0.333, 0.333, 0.333, 0.333, 0.333,
         0.333, 0.333, 0.333, 0.111, 0.333, 0.333, 0.333]
      end

      let(:worst_scenario_values) do
        [0.022, 0.022, 0.067, 0.067, 0.067, 0.067, 0.067, 0.067, 0.067, 0.067,
         0.067, 0.067, 0.067, 0.022, 0.067, 0.067, 0.067]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:best_scenario_values) do
        [0.294, 0.294, 0.294, 0.294, 0.294, 0.294, 0.294, 0.294, 0.294, 0.294,
         0.294, 0.294, 0.294, 0.294, 0.294, 0.294, 0.294]
      end

      let(:worst_scenario_values) do
        [0.059, 0.059, 0.059, 0.059, 0.059, 0.059, 0.059, 0.059, 0.059, 0.059,
         0.059, 0.059, 0.059, 0.059, 0.059, 0.059, 0.059]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:best_scenario_values) do
        [0.128, 0.128, 0.256, 0.385, 0.256, 0.385, 0.385, 0.256, 0.256, 0.385,
         0.256, 0.385, 0.385, 0.128, 0.256, 0.385, 0.385]
      end

      let(:worst_scenario_values) do
        [0.026, 0.026, 0.051, 0.077, 0.051, 0.077, 0.077, 0.051, 0.051, 0.077,
         0.051, 0.077, 0.077, 0.026, 0.051, 0.077, 0.077]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end
  end

  describe 'when questionnaire is management_and_governance' do
    let(:questionnaire) do
      Questionnaire.find_by(driver: 'management_and_governance')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:best_scenario_values) do
        [0.300, 0.100, 0.100, 0.100, 0.300, 0.100, 0.300, 0.100, 0.100, 0.100,
         0.100, 0.100, 0.100, 0.300, 0.300, 0.300, 0.200, 0.100, 0.100, 0.100,
         0.100, 0.100, 0.300, 0.300, 0.100, 0.100, 0.100, 0.300, 0.300]
      end

      let(:worst_scenario_values) do
        [0.060, 0.020, 0.020, 0.020, 0.060, 0.020, 0.060, 0.020, 0.020, 0.020,
         0.020, 0.020, 0.020, 0.060, 0.060, 0.060, 0.040, 0.020, 0.020, 0.020,
         0.020, 0.020, 0.060, 0.060, 0.020, 0.020, 0.020, 0.060, 0.060]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:best_scenario_values) do
        [0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176,
         0.118, 0.176, 0.176, 0.176, 0.176, 0.176, 0.118, 0.176, 0.176, 0.176,
         0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176, 0.176]
      end

      let(:worst_scenario_values) do
        [0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035,
         0.024, 0.035, 0.035, 0.035, 0.035, 0.035, 0.024, 0.035, 0.035, 0.035,
         0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035, 0.035]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:best_scenario_values) do
        [0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172,
         0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172,
         0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172, 0.172]
      end

      let(:worst_scenario_values) do
        [0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034,
         0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034,
         0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034, 0.034]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:best_scenario_values) do
        [0.205, 0.205, 0.205, 0.205, 0.205, 0.137, 0.205, 0.205, 0.137, 0.137,
         0.137, 0.137, 0.137, 0.205, 0.205, 0.205, 0.205, 0.137, 0.137, 0.137,
         0.137, 0.137, 0.205, 0.205, 0.137, 0.137, 0.137, 0.205, 0.205]
      end

      let(:worst_scenario_values) do
        [0.041, 0.041, 0.041, 0.041, 0.041, 0.027, 0.041, 0.041, 0.027, 0.027,
         0.027, 0.027, 0.027, 0.041, 0.041, 0.041, 0.041, 0.027, 0.027, 0.027,
         0.027, 0.027, 0.041, 0.041, 0.027, 0.027, 0.027, 0.041, 0.041]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end
  end

  describe 'when questionnaire is process' do
    let(:questionnaire) do
      Questionnaire.find_by(driver: 'process')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:best_scenario_values) do
        [0.208, 0.208, 0.625, 0.625, 0.208, 0.625, 0.208, 0.208, 0.208, 0.625,
         0.625, 0.625]
      end

      let(:worst_scenario_values) do
        [0.042, 0.042, 0.125, 0.125, 0.042, 0.125, 0.042, 0.042, 0.042, 0.125,
         0.125, 0.125]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:best_scenario_values) do
        [0.323, 0.484, 0.484, 0.484, 0.484, 0.484, 0.323, 0.323, 0.161, 0.484,
         0.484, 0.484]
      end

      let(:worst_scenario_values) do
        [0.065, 0.097, 0.097, 0.097, 0.097, 0.097, 0.065, 0.065, 0.032, 0.097,
         0.097, 0.097]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:best_scenario_values) do
        [0.429, 0.429, 0.429, 0.429, 0.429, 0.429, 0.429, 0.429, 0.286, 0.429,
         0.429, 0.429]
      end

      let(:worst_scenario_values) do
        [0.086, 0.086, 0.086, 0.086, 0.086, 0.086, 0.086, 0.086, 0.057, 0.086,
         0.086, 0.086]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:best_scenario_values) do
        [0.526, 0.000, 0.789, 0.000, 0.789, 0.789, 0.000, 0.000, 0.526, 0.789,
         0.000, 0.789]
      end

      let(:worst_scenario_values) do
        [0.105, 0.000, 0.158, 0.000, 0.158, 0.158, 0.000, 0.000, 0.105, 0.158,
         0.000, 0.158]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end
  end

  describe 'when questionnaire is raw_material' do
    let(:questionnaire) do
      Questionnaire.find_by(driver: 'raw_material')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:best_scenario_values) do
        [0.366, 0.366, 0.366, 0.122, 0.366, 0.366, 0.366, 0.122, 0.122, 0.244,
         0.244, 0.122, 0.122, 0.366, 0.122, 0.122, 0.122, 0.122, 0.122, 0.000,
         0.122, 0.366, 0.244]
      end

      let(:worst_scenario_values) do
        [0.073, 0.073, 0.073, 0.024, 0.073, 0.073, 0.073, 0.024, 0.024, 0.049,
         0.049, 0.024, 0.024, 0.073, 0.024, 0.024, 0.024, 0.024, 0.024, 0.000,
         0.024, 0.073, 0.049]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:best_scenario_values) do
        [0.283, 0.283, 0.283, 0.189, 0.283, 0.283, 0.283, 0.189, 0.094, 0.189,
         0.283, 0.189, 0.189, 0.283, 0.283, 0.094, 0.189, 0.189, 0.283, 0.000,
         0.094, 0.283, 0.283]
      end

      let(:worst_scenario_values) do
        [0.057, 0.057, 0.057, 0.038, 0.057, 0.057, 0.057, 0.038, 0.019, 0.038,
         0.057, 0.038, 0.038, 0.057, 0.057, 0.019, 0.038, 0.038, 0.057, 0.000,
         0.019, 0.057, 0.057]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:best_scenario_values) do
        [0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227,
         0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.227, 0.076,
         0.152, 0.227, 0.227]
      end

      let(:worst_scenario_values) do
        [0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045,
         0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.045, 0.015,
         0.030, 0.045, 0.045]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:best_scenario_values) do
        [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
         0.000, 0.000, 0.455, 0.000, 0.000, 0.000, 0.682, 0.682, 0.682, 0.682,
         0.455, 0.682, 0.682]
      end

      let(:worst_scenario_values) do
        [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
         0.000, 0.000, 0.091, 0.000, 0.000, 0.000, 0.136, 0.136, 0.136, 0.136,
         0.091, 0.136, 0.136]
      end

      it do
        expect(all_scenario_weights[:max]).to eq(best_scenario_values)
      end

      it do
        expect(all_scenario_weights[:min]).to eq(worst_scenario_values)
      end
    end
  end
end
