# frozen_string_literal: true

require 'rails_helper'

describe CalculateTopsisJob, type: :job do
  context 'when driver is social_human' do
    let(:supplier) do
      Supplier.first
    end

    let(:material) do
      supplier.materials.first
    end

    before do
      ['humano_social_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end

      described_class.perform_now('social_human', supplier)
    end

    it { expect(material.social_driver).to eq(56) }

    describe 'is in high queue' do
      it { expect(CalculateTopsisJob.new.queue_name).to eq('high') }
    end
  end

  context 'when driver is management_and_governance' do
    let(:supplier) do
      Supplier.first
    end

    let(:material) do
      supplier.materials.first
    end

    before do
      ['gestao_e_governanca_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end

      described_class.perform_now('management_and_governance', supplier)
    end

    it { expect(material.management_driver).to eq(36) }

    describe 'is in high queue' do
      it { expect(CalculateTopsisJob.new.queue_name).to eq('high') }
    end
  end

  context 'when driver is process' do
    let(:supplier) do
      Supplier.first
    end

    let(:material) do
      supplier.materials.first
    end

    before do
      ['processo_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end

      described_class.perform_now('process', material)
    end

    it { expect(material.manufacture_driver).to eq(76) }

    describe 'is in high queue' do
      it { expect(CalculateTopsisJob.new.queue_name).to eq('high') }
    end
  end

  context 'when driver is raw_material' do
    let(:supplier) do
      Supplier.first
    end

    let(:material) do
      supplier.materials.first
    end

    before do
      ['materia_prima_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end

      described_class.perform_now('raw_material', material)
    end

    it { expect(material.materiality_driver).to eq(94) }

    describe 'is in high queue' do
      it { expect(CalculateTopsisJob.new.queue_name).to eq('high') }
    end
  end
end
