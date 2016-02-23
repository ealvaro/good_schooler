# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..5).each do |c|
  CodeSchool.create(name: "code_School_#{c}")
end
(1..30).each do |u|
  User.create(name: "User#{u}", email: "email_user#{u}@gmail.com", code_school_id: (u % 5) + 1)
end
