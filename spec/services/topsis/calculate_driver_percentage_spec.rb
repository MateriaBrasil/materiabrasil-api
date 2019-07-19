# frozen_string_literal: true

require 'rails_helper'

describe Topsis::CalculateDriverPercentage do
  describe 'when questionnaire is social_human' do
    before do
      ['humano_social_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:driver) { 'social_human' }

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(33)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(20)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(71)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(56)
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

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(34)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(39)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(49)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      it do
        expect(described_class.execute(driver, supplier)[:payload]).to eq(36)
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

    context 'with small company' do
      let(:material) do
        Supplier.find_by(type_of_company: 1).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(97)
      end
    end

    context 'with medium company' do
      let(:material) do
        Supplier.find_by(type_of_company: 2).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(96)
      end
    end

    context 'with large company' do
      let(:material) do
        Supplier.find_by(type_of_company: 3).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(54)
      end
    end

    context 'with service company' do
      let(:material) do
        Supplier.find_by(type_of_company: 4).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(76)
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

    context 'with small company' do
      let(:material) do
        Supplier.find_by(type_of_company: 1).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(91)
      end
    end

    context 'with medium company' do
      let(:material) do
        Supplier.find_by(type_of_company: 2).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(89)
      end
    end

    context 'with large company' do
      let(:material) do
        Supplier.find_by(type_of_company: 3).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(32)
      end
    end

    context 'with service company' do
      let(:material) do
        Supplier.find_by(type_of_company: 4).materials.first
      end

      it do
        expect(described_class.execute(driver, material)[:payload]).to eq(94)
      end
    end
  end
end
