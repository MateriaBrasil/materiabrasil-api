# frozen_string_literal: true

require 'rails_helper'

describe Topsis::NormalizeBaseForQuestionnaire do
  describe 'when questionnaire is social_human' do
    before do
      load(Dir[Rails.root.join('db', 'seeds', 'humano_social_seeds.rb')][0])
    end

    context 'with small company' do
      it do
        expect(described_class.execute('social_human', 'small')[:payload])
          .to eq(0.02702702702702703)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('social_human', 'medium')[:payload])
          .to eq(0.022222222222222223)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('social_human', 'large')[:payload])
          .to eq(0.0196078431372549)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('social_human', 'service')[:payload])
          .to eq(0.02564102564102564)
      end
    end
  end

  describe 'when questionnaire is management_and_governance' do
    before do
      load(
        Dir[Rails.root.join('db', 'seeds', 'gestao_e_governanca_seeds.rb')][0]
      )
    end

    context 'with small company' do
      it do
        expect(described_class.execute(
          'management_and_governance', 'small'
        )[:payload]).to eq(0.02)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute(
          'management_and_governance', 'medium'
        )[:payload]).to eq(0.011764705882352941)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute(
          'management_and_governance', 'large'
        )[:payload]).to eq(0.011494252873563218)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute(
          'management_and_governance', 'service'
        )[:payload]).to eq(0.0136986301369863)
      end
    end
  end

  describe 'when questionnaire is process' do
    before do
      load(Dir[Rails.root.join('db', 'seeds', 'processo_seeds.rb')][0])
    end

    context 'with small company' do
      it do
        expect(described_class.execute('process', 'small')[:payload])
          .to eq(0.041666666666666664)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('process', 'medium')[:payload])
          .to eq(0.03225806451612903)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('process', 'large')[:payload])
          .to eq(0.02857142857142857)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('process', 'service')[:payload])
          .to eq(0.05263157894736842)
      end
    end
  end

  describe 'when questionnaire is raw_material' do
    before do
      load(Dir[Rails.root.join('db', 'seeds', 'materia_prima_seeds.rb')][0])
    end

    context 'with small company' do
      it do
        expect(described_class.execute('raw_material', 'small')[:payload])
          .to eq(0.024390243902439025)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('raw_material', 'medium')[:payload])
          .to eq(0.018867924528301886)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('raw_material', 'large')[:payload])
          .to eq(0.015151515151515152)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('raw_material', 'service')[:payload])
          .to eq(0.045454545454545456)
      end
    end
  end

  describe 'when questionnaire is raw_material' do
    context 'with small company' do
      it do
        expect(described_class.execute('some_other', 'small')[:errors])
          .to eq(questionnaire: 'Questionnaire not found')
      end
    end
  end
end
