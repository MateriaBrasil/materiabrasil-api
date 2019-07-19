# frozen_string_literal: true

require 'rails_helper'

describe Topsis::MinMaxDistances do
  let(:all_distances) do
    best_values = []
    worst_values = []
    supplier_or_material.answers.by_driver(driver)
      .each do |answer|
        calculation = described_class.execute(
          answer, type_of_company
        )[:payload]
        best_values << calculation[:positive].round(3)
        worst_values << calculation[:negative].round(3)
      end

    { negative: worst_values, positive: best_values }
  end

  describe 'when questionnaire is social_human' do
    before do
      ['humano_social_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:driver) { 'social_human' }

    let(:type_of_company) do
      supplier_or_material.type_of_company
    end

    context 'with small company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:max_distance_values) do
        [0.012, 0.007, 0.012, 0.105, 0.012, 0.000, 0.047, 0.012, 0.026, 0.047,
         0.026, 0.047]
      end

      let(:min_distance_values) do
        [0.000, 0.001, 0.012, 0.000, 0.000, 0.105, 0.000, 0.000, 0.026, 0.000,
         0.026, 0.000]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with medium company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:max_distance_values) do
        [0.008, 0.004, 0.018, 0.071, 0.071, 0.0, 0.071, 0.071, 0.018, 0.071,
         0.018, 0.071]
      end

      let(:min_distance_values) do
        [0.0, 0.0, 0.018, 0.0, 0.0, 0.071, 0.0, 0.0, 0.018, 0.0, 0.018, 0.0]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with large company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:max_distance_values) do
        [0.014, 0.031, 0.000, 0.000, 0.003, 0.014, 0.014]
      end

      let(:min_distance_values) do
        [0.014, 0.003, 0.055, 0.055, 0.031, 0.014, 0.014]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with service company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:max_distance_values) do
        [0.006, 0.003, 0.000, 0.095, 0.011, 0.024, 0.000, 0.000, 0.000, 0.000,
         0.053, 0.001, 0.011, 0.053, 0.053]
      end

      let(:min_distance_values) do
        [0.001, 0.003, 0.042, 0.000, 0.011, 0.024, 0.095, 0.042, 0.095, 0.042,
         0.006, 0.006, 0.011, 0.006, 0.006]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end
  end

  describe 'when questionnaire is management_and_governance' do
    before do
      ['gestao_e_governanca_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:driver) { 'management_and_governance' }
    let(:type_of_company) do
      supplier_or_material.type_of_company
    end

    context 'with small company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:max_distance_values) do
        [0.032, 0.004, 0.006, 0.058, 0.006, 0.004, 0.006, 0.000, 0.058, 0.000,
         0.026, 0.000, 0.000, 0.000, 0.000, 0.000, 0.032, 0.014, 0.006, 0.006,
         0.006, 0.058]
      end

      let(:min_distance_values) do
        [0.004, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.058, 0.000, 0.058,
         0.000, 0.006, 0.006, 0.006, 0.006, 0.006, 0.004, 0.014, 0.000, 0.000,
         0.000, 0.000]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with medium company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:max_distance_values) do
        [0.011, 0.011, 0.02, 0.02, 0.02, 0.005, 0.02, 0.0, 0.02, 0.0, 0.009,
         0.0, 0.0, 0.0, 0.0, 0.0, 0.011, 0.005, 0.02, 0.02, 0.02, 0.02]
      end

      let(:min_distance_values) do
        [0.001, 0.001, 0.0, 0.0, 0.0, 0.001, 0.0, 0.02, 0.0, 0.02, 0.0, 0.02,
         0.02, 0.02, 0.02, 0.02, 0.001, 0.005, 0.0, 0.0, 0.0, 0.0]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with large company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:max_distance_values) do
        [0.001, 0.005, 0.011, 0.011, 0.011, 0.019, 0.019, 0.011, 0.000, 0.001,
         0.011, 0.001, 0.000, 0.000, 0.000, 0.000, 0.000, 0.019, 0.019, 0.019,
         0.005, 0.011]
      end

      let(:min_distance_values) do
        [0.011, 0.005, 0.001, 0.001, 0.001, 0.000, 0.000, 0.001, 0.019, 0.011,
         0.001, 0.011, 0.019, 0.019, 0.019, 0.019, 0.019, 0.000, 0.000, 0.000,
         0.005, 0.001]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with service company' do
      let(:supplier_or_material) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:max_distance_values) do
        [0.007, 0.000, 0.027, 0.015, 0.012, 0.000, 0.002, 0.015, 0.000, 0.000,
         0.015, 0.027, 0.012, 0.027]
      end

      let(:min_distance_values) do
        [0.007, 0.027, 0.000, 0.002, 0.000, 0.012, 0.015, 0.002, 0.012, 0.012,
         0.002, 0.000, 0.000, 0.000]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end
  end

  describe 'when questionnaire is process' do
    before do
      ['processo_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:driver) { 'process' }

    let(:type_of_company) do
      supplier.type_of_company
    end

    let(:supplier_or_material) do
      supplier.materials.first
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:max_distance_values) do
        [0.002, 0.000, 0.000, 0.000, 0.000, 0.000, 0.007, 0.016]
      end

      let(:min_distance_values) do
        [0.016, 0.028, 0.250, 0.250, 0.028, 0.250, 0.007, 0.002]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:max_distance_values) do
        [0.004, 0.0, 0.0, 0.0, 0.0, 0.0, 0.017, 0.009]
      end

      let(:min_distance_values) do
        [0.037, 0.15, 0.15, 0.15, 0.15, 0.15, 0.017, 0.001]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:max_distance_values) do
        [0.066, 0.029, 0.029, 0.000, 0.000, 0.013, 0.118, 0.029, 0.029]
      end

      let(:min_distance_values) do
        [0.007, 0.029, 0.029, 0.118, 0.118, 0.013, 0.000, 0.029, 0.029]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:max_distance_values) do
        [0.100, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.177, 0.000, 0.000,
         0.224]
      end

      let(:min_distance_values) do
        [0.011, 0.000, 0.399, 0.000, 0.399, 0.399, 0.000, 0.000, 0.399, 0.000,
         0.025]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end
  end

  describe 'when questionnaire is raw_material' do
    before do
      ['materia_prima_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:driver) { 'raw_material' }

    let(:type_of_company) do
      supplier.type_of_company
    end

    let(:supplier_or_material) do
      supplier.materials.first
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:max_distance_values) do
        [0.000, 0.021, 0.000, 0.005, 0.000, 0.000, 0.005, 0.010, 0.000, 0.000,
         0.000]
      end

      let(:min_distance_values) do
        [0.086, 0.021, 0.086, 0.048, 0.038, 0.010, 0.048, 0.000, 0.010, 0.010,
         0.086]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:max_distance_values) do
        [0.0, 0.013, 0.0, 0.003, 0.0, 0.0, 0.003, 0.023, 0.0, 0.0, 0.0]
      end

      let(:min_distance_values) do
        [0.051, 0.013, 0.051, 0.029, 0.051, 0.023, 0.029, 0.0, 0.023, 0.006,
         0.051]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:max_distance_values) do
        [0.033, 0.019, 0.000, 0.019, 0.033, 0.033, 0.033, 0.033, 0.033, 0.000,
         0.033, 0.033, 0.008, 0.008, 0.000, 0.000, 0.033, 0.000, 0.015, 0.033,
         0.000]
      end

      let(:min_distance_values) do
        [0.000, 0.002, 0.033, 0.002, 0.000, 0.000, 0.000, 0.000, 0.000, 0.033,
         0.000, 0.000, 0.008, 0.008, 0.033, 0.033, 0.000, 0.004, 0.000, 0.000,
         0.033]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:max_distance_values) do
        [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
         0.000, 0.000, 0.000, 0.074]
      end

      let(:min_distance_values) do
        [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.132, 0.000, 0.298,
         0.298, 0.132, 0.298, 0.074]
      end

      it do
        expect(all_distances[:positive]).to eq(max_distance_values)
      end

      it do
        expect(all_distances[:negative]).to eq(min_distance_values)
      end
    end
  end
end
