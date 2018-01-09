# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contact.delete_all
contact_count = ENV.fetch("CONTACT_COUNT", 2000)

puts "Creating #{contact_count} contacts..."

contact_count.times do
  Contact.create(
    name: Faker::Name.name,
    company_name: Faker::Company.name,
    email: Faker::Internet.email,
    date_of_birth: Faker::Date.birthday(18, 65),
  )
end

puts "Done"
