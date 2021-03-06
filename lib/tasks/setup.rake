desc 'drops the db, creates db, migrates db and populates sample data'
task setup: [:environment, 'db:drop', 'db:create', 'db:migrate'] do
  Rake::Task['populate_with_sample_data'].invoke if Rails.env.development?
end

task populate_with_sample_data: [:environment] do
  if Rails.env.production?
    puts "Skipping deleting and populating sample data in production"
  else
    create_sample_data!
    puts "sample data has been added."
  end
end

def create_sample_data!
  puts 'Seeding with sample data...'
  create_user! email: 'oliver@example.com'
  create_site!
end

def create_user!(options = {})
  user_attributes = { first_name: 'Oliver', last_name: 'Smith' }
  attributes = user_attributes.merge options
  User.create! attributes
end

def create_site!
  Site.create!(name: 'Spinkart')
end
