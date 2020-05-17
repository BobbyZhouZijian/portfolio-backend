# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  ed = Education.create({
                          institution_name: Faker::University.name,
                          link: Faker::Internet.domain_name,
                          degree: Faker::Educator.degree
                        })
  ed.education_contents.create({ content: Faker::Lorem.sentence })
end


10.times do
  Project.create({
                   project_name: Faker::FunnyName.three_word_name,
                   repo_link: Faker::Internet.domain_name,
                   open_repo: true,
                   content: Faker::Lorem.sentence
                 })
end

About.create({
               header: Faker::Lorem.sentence,
               life: Faker::Lorem.paragraph,
               misc: Faker::Lorem.paragraph
             })
