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

  context 'when there no one N/A question/answer' do
    let(:user) do
      User.create!(
        email: 'supplier1@bar.com',
        first_name: 'Foo',
        last_name: 'Bar',
        password: '123456789'
      )
    end

    let(:supplier) do
      Supplier.create!(
        user: user,
        name: 'Zebu Mídias Sustentáveis ltda - ME',
        description: 'Zebu Mídias Sustentáveis ltda - ME',
        website: 'http://foo',
        email: 'foo@company.com',
        cnpj: '123456789',
        company_name: 'Foo Inc',
        municipal_subscription: 'does not apply',
        state_subscription: '987654321',
        phone: '5551987654321',
        company_revenue: '100000000',
        type_of_company: 1,
        reach: 'country',
        image_url: 'http://foo-image'
      )
    end

    let(:material) do
      Material.create!(
        name: 'Cartão de Bambu',
        supplier: supplier,
        image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
        description: 'description',
        average_price: 'R$ 30,00',
        code: '00672',
        highlighted: true,
        technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
          'testfiles/resources/pdf/dummy.pdf',
        published: true
      )
    end

    let(:questionnaire) do
      Questionnaire.create!(
        id: 1,
        name: 'Humano Social',
        about_type: 'Supplier',
        driver: 'social_human',
        sorting: 1
      )
    end

    let(:questions) do
      Question.create!(
        [
          {
            questionnaire: questionnaire,
            sorting: 1,
            weight_for_small_companies: 1,
            weight_for_medium_companies: 2,
            weight_for_large_companies: 3,
            weight_for_service_companies: 0,
            description: 'description',
            options_attributes: [
              { value: 1, description: 'Matéria Prima Importada' },
              { value: 2, description: 'Produção industrial' },
              { value: 3, description: 'Produção agropecuária' },
              { value: 4, description: 'Extrativista' },
              { value: 5, description: 'Produção agloflorestal' }
            ]
          },
          {
            questionnaire: questionnaire,
            sorting: 2,
            weight_for_small_companies: 1,
            weight_for_medium_companies: 2,
            weight_for_large_companies: 3,
            weight_for_service_companies: 0,
            description: 'description',
            options_attributes: [
              { value: 1, description: 'Matéria Prima Importada' },
              { value: 2, description: 'Produção industrial' },
              { value: 3, description: 'Produção agropecuária' },
              { value: 4, description: 'Extrativista' },
              { value: 5, description: 'Produção agloflorestal' }
            ]
          },
          {
            questionnaire: questionnaire,
            sorting: 3,
            weight_for_small_companies: 0,
            weight_for_medium_companies: 2,
            weight_for_large_companies: 3,
            weight_for_service_companies: 0,
            description: 'description',
            options_attributes: [
              { value: 1, description: 'Matéria Prima Importada' },
              { value: 2, description: 'Produção industrial' },
              { value: 3, description: 'Produção agropecuária' },
              { value: 4, description: 'Extrativista' },
              { value: 5, description: 'Produção agloflorestal' }
            ]
          }
        ]
      )
    end

    let(:answers) do
      [
        { questionnaire_id: 1, question_index: 1, option_value: 2 },
        { questionnaire_id: 1, question_index: 2, option_value: 3 }
      ].each do |options|
        question = Question.find_by(
          questionnaire_id: options[:questionnaire_id],
          sorting: options[:question_index]
        )

        option = question.options.find_by(
          value: options[:option_value]
        )

        Answer.create!(
          about: supplier,
          question: question,
          option: option
        )
      end
    end

    before do
      material
      # create 3 questions with 1 of them zero weight
      questions
      # create 2 answers, because 1 of them is weight zero
      answers
      described_class.perform_now('social_human', supplier)
    end

    it do
      material.reload
      expect(material.social_driver).to eq(28)
    end

    describe 'is in high queue' do
      it { expect(CalculateTopsisJob.new.queue_name).to eq('high') }
    end
  end
end
