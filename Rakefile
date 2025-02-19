# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks


namespace :import_incidents_csv do
  task :create_incidents => :environment do
    csv_text = File.read('oha.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Moulding.create!(row.to_hash)
  end
end 
end