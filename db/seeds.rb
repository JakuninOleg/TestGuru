# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ name: 'Ruby' },
                 { name: 'Javascript' },
                 { name: 'Python' },
                 { name: 'HTML' }])

Admin.create(name: 'Jakunin Oleg')

Test.create([{ title: 'OOP', category_id: 1, admin_id: 1 },
             { title: 'React', level: 4, category_id: 2, admin_id: 1 },
             { title: 'Big Data', level: 3, category_id: 3, admin_id: 1 },
             { title: 'Bootstrap', level: 0, category_id: 4, admin_id: 1 },
             { title: 'Metaprogramming', category_id: 1, admin_id: 1 },
             { title: 'Rails', level: 6, category_id: 1, admin_id: 1 }])

User.create([{ name: 'Student1', email: 'student1@gmail.com' },
             { name: 'Student2', email: 'student2@gmail.com' }])

Question.create([{ body: 'What is a class?', test_id: 1 },
                 { body: 'Component lifecycle', test_id: 2 },
                 { body: 'Grid structure', test_id: 4 }])

Answer.create([{ body: 'Class is an object and object is a class', correct: true, question_id: 1 },
               { body: 'ComponentDidMount, ComponentWillMount, etc.', question_id: 3 }])

Admin.create(name: 'Jakunin Oleg')

TestPassage.create([{ user_id: 1, test_id: 1 },
                    { user_id: 1, test_id: 2 },
                    { user_id: 2, test_id: 3 }])
