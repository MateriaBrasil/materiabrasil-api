# frozen_string_literal: true

require 'rails_helper'

describe Topsis::CalculateAnswerWeight do
  let(:questions) do
    questionnaire.questions
  end

  let(:normalized_base) do
    Topsis::NormalizeBaseForQuestionnaire.execute(
      questionnaire.driver, supplier.type_of_company
    )[:payload]
  end

  let(:all_answers_weights) do
    # This array will contain ALL answers' weights
    # for a specific questionnaire and supplier and his answers
    arr = []
    question_ids = supplier_or_material.answers.joins(question: :questionnaire)
      .where(questionnaires: { driver: questionnaire.driver })
      .pluck('answers.question_id')
    Question.where(id: question_ids).order(sorting: :asc).each do |question|
      arr << described_class.execute(
        normalized_base, supplier_or_material, question
      )[:payload].round(3)
    end

    arr
  end

  describe 'when questionnaire is social_human' do
    before do
      ['humano_social_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:questionnaire) do
      Questionnaire.find_by(driver: 'social_human')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.027, 0.054, 0.162, 0.081, 0.027, 0.405,
         0.054, 0.027, 0.243, 0.054, 0.243, 0.054]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.022, 0.044, 0.2, 0.067, 0.067, 0.333, 0.067, 0.067, 0.2, 0.067, 0.2,
         0.067]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.176, 0.118, 0.294, 0.294, 0.235, 0.176, 0.176]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.051, 0.077, 0.256, 0.077, 0.154, 0.231, 0.385, 0.256, 0.385,
         0.256, 0.154, 0.103, 0.154, 0.154, 0.154]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
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

    let(:questionnaire) do
      Questionnaire.find_by(driver: 'management_and_governance')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.120, 0.040, 0.020, 0.060, 0.020, 0.040, 0.020, 0.300, 0.060, 0.300,
         0.040, 0.100, 0.100, 0.100, 0.100, 0.100, 0.120, 0.180, 0.020, 0.020,
         0.020, 0.060]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.071, 0.071, 0.035, 0.035, 0.035, 0.047, 0.035, 0.176, 0.035, 0.176,
         0.024, 0.176, 0.176, 0.176, 0.176, 0.176, 0.071, 0.106, 0.035, 0.035,
         0.035, 0.035]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.138, 0.103, 0.069, 0.069, 0.069, 0.034, 0.034, 0.069, 0.172, 0.138,
         0.069, 0.138, 0.172, 0.172, 0.172, 0.172, 0.172, 0.034, 0.034, 0.034,
         0.103, 0.069]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:supplier_or_material) do
        supplier
      end

      let(:excel_step_1) do
        [0.123, 0.205, 0.041, 0.082, 0.027, 0.137, 0.164, 0.082, 0.137, 0.137,
         0.082, 0.041, 0.027, 0.041]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
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

    let(:questionnaire) do
      Questionnaire.find_by(driver: 'process')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.167, 0.208, 0.625, 0.625, 0.208, 0.625, 0.125, 0.083]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.258, 0.484, 0.484, 0.484, 0.484, 0.484, 0.194, 0.065]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.171, 0.257, 0.257, 0.429, 0.429, 0.171, 0.086, 0.257, 0.257]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.211, 0.000, 0.789, 0.000, 0.789, 0.789, 0.000, 0.105, 0.789, 0.000,
         0.316]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
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

    let(:questionnaire) do
      Questionnaire.find_by(driver: 'raw_material')
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.366, 0.220, 0.366, 0.293, 0.244, 0.122, 0.293, 0.024, 0.122, 0.122,
         0.366]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with medium company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 2)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.283, 0.17, 0.283, 0.226, 0.283, 0.189, 0.226, 0.038, 0.189, 0.094,
         0.283]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with large company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 3)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.045, 0.091, 0.227, 0.091, 0.045, 0.045, 0.045, 0.045, 0.045, 0.227,
         0.045, 0.045, 0.136, 0.136, 0.227, 0.227, 0.045, 0.076, 0.030, 0.045,
         0.227]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end

    context 'with service company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 4)
      end

      let(:supplier_or_material) do
        supplier.materials.first
      end

      let(:excel_step_1) do
        [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.455, 0.000, 0.682,
         0.682, 0.455, 0.682, 0.409]
      end

      it do
        expect(all_answers_weights).to eq(excel_step_1)
      end
    end
  end

  describe 'when the answer is not found' do
    before do
      ['materia_prima_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end
    end

    let(:questionnaire) do
      Questionnaire.find_by(driver: 'raw_material')
    end

    let(:calculation) do
      question = Question.find(material.answers.joins(question: :questionnaire)
        .where(questionnaires: { driver: 'raw_material' })
        .limit(1)
        .pluck('answers.question_id')
        .first)

      # Delete the answer to trigger the error
      Answer.find_by(
        about: material, question_id: question.id
      ).destroy

      described_class.execute(
        normalized_base, material, question
      )[:errors]
    end

    context 'with small company' do
      let(:supplier) do
        Supplier.find_by(type_of_company: 1)
      end

      let(:material) do
        supplier.materials.first
      end

      it do
        expect(calculation).to eq(
          answer: 'there is not an answer for this question'
        )
      end
    end
  end
end
