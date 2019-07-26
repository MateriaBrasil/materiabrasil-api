# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  subject(:questionnaire) do
    described_class.new(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'materiality_driver',
      sorting: 123
    )
  end

  let(:create_questions) do
    %w[foo bar baz].each_with_index do |text, index|
      Question.create!(
        questionnaire: questionnaire,
        description: text,
        sorting: index
      )
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :about_type }
  it { is_expected.to validate_presence_of :driver }
  it { is_expected.to validate_presence_of :sorting }

  describe '#as_json' do
    before do
      create_questions
    end

    let(:json) do
      {
        id: questionnaire.id,
        name: questionnaire.name,
        about_type: questionnaire.about_type,
        driver: questionnaire.driver,
        sorting: questionnaire.sorting,
        questions: Question.all.order(:sorting).as_json
      }
    end

    it 'returns only the necessary attributes' do
      expect(questionnaire.as_json).to eq(json)
    end
  end

  describe 'database on_cascade triggers' do
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
        type_of_company: 4,
        reach: 'country',
        image_url: 'http://foo-image'
      )
    end

    let(:create_options) do
      Question.find_each do |question|
        %w[foo bar baz].each_with_index do |description, index|
          Option.create!(
            question: question,
            description: description,
            value: index
          )
        end
      end
    end

    let(:create_answer) do
      Answer.create!(
        about: supplier,
        question: Question.first,
        option: Question.first.options.sample
      )
    end

    let(:delete_questionnaire) do
      ActiveRecord::Base.connection.execute(
        "DELETE FROM questionnaires WHERE id = #{questionnaire.id}"
      )
    end

    let(:delete_questions) do
      ActiveRecord::Base.connection.execute(
        'DELETE FROM questions USING questionnaires ' \
        "WHERE questionnaires.id = #{questionnaire.id}"
      )
    end

    context 'when questionnaire is not empty' do
      before do
        questionnaire.save!
        create_questions
        create_options
      end

      it do
        expect { delete_questionnaire }.to raise_error(
          ActiveRecord::InvalidForeignKey
        )
      end
    end

    context 'when deleting questions with options and answers' do
      before do
        questionnaire.save!
        create_questions
        create_options
        create_answer
        delete_questions
      end

      it { expect(Question.count).to eq(0) }
      it { expect(Option.count).to eq(0) }
      it { expect(Answer.count).to eq(0) }
    end

    context 'when questionnaire is empty' do
      before do
        questionnaire.save!
      end

      it do
        expect { delete_questionnaire }.to change(Questionnaire, :count)
      end
    end
  end
end
