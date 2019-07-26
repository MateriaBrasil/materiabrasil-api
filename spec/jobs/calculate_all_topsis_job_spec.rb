# frozen_string_literal: true

require 'rails_helper'

describe CalculateAllTopsisJob, type: :job do
  describe 'calculating all topsis again' do
    before do
      ['humano_social_seeds.rb',
       'gestao_e_governanca_seeds.rb',
       'processo_seeds.rb',
       'materia_prima_seeds.rb',
       'supplier_answer_seeds.rb'].each do |seed_file|
        load(Dir[Rails.root.join('db', 'seeds', seed_file)][0])
      end

      described_class.perform_now
    end

    it { expect(CalculateTopsisJob).to have_been_enqueued.exactly(16) }
  end

  describe 'is in high queue' do
    it { expect(described_class.new.queue_name).to eq('high') }
  end
end
