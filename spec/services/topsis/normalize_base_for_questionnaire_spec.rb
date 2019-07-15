# frozen_string_literal: true

require 'rails_helper'

describe Topsis::NormalizeBaseForQuestionnaire do
  describe 'when questionnaire is social_human' do
    before do
      load(Dir[Rails.root.join('db', 'seeds', 'humano_social_seeds.rb')][0])
    end

    context 'with small company' do
      it do
        expect(described_class.execute('social_human', 1))
          .to eq(0.02702702702702703)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('social_human', 2))
          .to eq(0.022222222222222223)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('social_human', 3))
          .to eq(0.0196078431372549)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('social_human', 4))
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
        expect(described_class.execute('management_and_governance', 1))
          .to eq(0.02)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('management_and_governance', 2))
          .to eq(0.011764705882352941)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('management_and_governance', 3))
          .to eq(0.011494252873563218)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('management_and_governance', 4))
          .to eq(0.0136986301369863)
      end
    end
  end

  describe 'when questionnaire is process' do
    before do
      load(Dir[Rails.root.join('db', 'seeds', 'processo_seeds.rb')][0])
    end

    context 'with small company' do
      it do
        expect(described_class.execute('process', 1))
          .to eq(0.041666666666666664)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('process', 2))
          .to eq(0.03225806451612903)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('process', 3))
          .to eq(0.02857142857142857)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('process', 4))
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
        expect(described_class.execute('raw_material', 1))
          .to eq(0.024390243902439025)
      end
    end

    context 'with medium company' do
      it do
        expect(described_class.execute('raw_material', 2))
          .to eq(0.018867924528301886)
      end
    end

    context 'with large company' do
      it do
        expect(described_class.execute('raw_material', 3))
          .to eq(0.015151515151515152)
      end
    end

    context 'with service company' do
      it do
        expect(described_class.execute('raw_material', 4))
          .to eq(0.045454545454545456)
      end
    end
  end
end
