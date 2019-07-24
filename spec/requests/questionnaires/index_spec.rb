# frozen_string_literal: true

require 'rails_helper'

describe 'GET /questionnaires', type: :request do
  let(:user) do
    User.create!(
      email: 'supplier1@bar.com',
      first_name: 'Foo',
      last_name: 'Bar',
      password: '123456789'
    )
  end

  context 'when about_type is present AND about_id is blank' do
    before do
      load(Dir[Rails.root.join('db', 'seeds', 'humano_social_seeds.rb')][0])
      get '/questionnaires', params: { about_type: 'Supplier' }
    end

    it { expect(response).to have_http_status(:ok) }
    it do
      expect(response.body).to eq(
        Questionnaire.where(about_type: 'Supplier').order(:sorting).to_json
      )
    end
    it do
      expect(JSON.parse(response.body)[0]['questions'].count).to eq(17)
    end
  end

  context 'when about_type AND about_id is present' do
    context 'with company is small' do
      let(:questionnaire) do
        Questionnaire.find_by(driver: 'social_human')
      end

      let(:expected_array) do
        questionnaire.questions
          .where.not(weight_for_small_companies: 0)
          .order(:sorting).as_json
      end

      before do
        load(Dir[Rails.root.join('db', 'seeds', 'humano_social_seeds.rb')][0])

        get '/questionnaires', params: {
          about_type: 'Supplier', about_id: supplier('small').id
        }
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)[0]['questions'].count).to eq(17) }
      it do
        expect(JSON.parse(response.body)[0]['questions'].to_json).to eq(
          expected_array.to_json
        )
      end
    end

    context 'with company is medium' do
      let(:questionnaire) do
        Questionnaire.find_by(driver: 'management_and_governance')
      end

      let(:expected_array) do
        questionnaire.questions
          .where.not(weight_for_medium_companies: 0)
          .order(:sorting).as_json
      end

      before do
        load(
          Dir[Rails.root.join('db', 'seeds', 'gestao_e_governanca_seeds.rb')][0]
        )

        get '/questionnaires', params: {
          about_type: 'Supplier', about_id: supplier('medium').id
        }
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)[0]['questions'].count).to eq(29) }
      it do
        expect(JSON.parse(response.body)[0]['questions'].to_json).to eq(
          expected_array.to_json
        )
      end
    end

    context 'with company is large' do
      let(:questionnaire) do
        Questionnaire.find_by(driver: 'process')
      end

      let(:expected_array) do
        questionnaire.questions
          .where.not(weight_for_large_companies: 0)
          .order(:sorting).as_json
      end

      before do
        load(
          Dir[Rails.root.join('db', 'seeds', 'processo_seeds.rb')][0]
        )

        get '/questionnaires', params: {
          about_type: 'Material', about_id: material('large').id
        }
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)[0]['questions'].count).to eq(12) }
      it do
        expect(JSON.parse(response.body)[0]['questions'].to_json).to eq(
          expected_array.to_json
        )
      end
    end

    context 'with company is service' do
      let(:questionnaire) do
        Questionnaire.find_by(driver: 'raw_material')
      end

      let(:expected_array) do
        questionnaire.questions
          .where.not(weight_for_service_companies: 0)
          .order(:sorting).as_json
      end

      before do
        load(
          Dir[Rails.root.join('db', 'seeds', 'materia_prima_seeds.rb')][0]
        )

        get '/questionnaires', params: {
          about_type: 'Material', about_id: material('service').id
        }
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)[0]['questions'].count).to eq(8) }
      it do
        expect(JSON.parse(response.body)[0]['questions'].to_json).to eq(
          expected_array.to_json
        )
      end
    end
  end

  context 'when about_type AND about_id is blank' do
    let(:expected_array) do
      Questionnaire.all.order(:sorting).as_json
    end

    before do
      ['gestao_e_governanca_seeds.rb',
       'humano_social_seeds.rb',
       'materia_prima_seeds.rb',
       'processo_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end

      get '/questionnaires'
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(JSON.parse(response.body).length).to eq(4) }

    it do
      expect(response.body).to eq(expected_array.to_json)
    end
  end

  context 'with incorrect request' do
    before { get '/questionnaires', params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end

  private

  # rubocop:disable Metrics/MethodLength
  def supplier(size)
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
      type_of_company: size,
      reach: 'country',
      image_url: 'http://foo-image'
    )
  end

  def material(size)
    Material.create!(
      name: 'Cartão de Bambu',
      supplier: supplier(size),
      image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
      description: 'Lona com urdume de algodão natural, sem aplicação de '\
      ' tingimento e trama de algodão reciclado. Foi desenvolvido com o'\
      ' intuito de ser ecologicamente correto e orgânico, por isso em sua'\
      ' composição foram utilizadas apenas fibras. A mescla de fios de'\
      ' algodão novos com fios já reciclados garante um visual rústico e'\
      ' exclusivo.',
      average_price: 'R$ 30,00',
      code: '00672',
      highlighted: true,
      technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
        'testfiles/resources/pdf/dummy.pdf',
      published: true
    )
  end
  # rubocop:enable Metrics/MethodLength
end
