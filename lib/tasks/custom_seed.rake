# frozen_string_literal: true

namespace :db do
  namespace :seed do
    task single: :environment do
      filename = Dir[Rails.root.join('db', "#{ENV['SEED']}.rb")][0]
      puts "Seeding ----> #{filename}..."
      load(filename) if File.exist?(filename)
    end
  end
end
