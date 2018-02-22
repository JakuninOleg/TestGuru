# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ategories = Category.create([{ name: 'Ruby' },
                              { name: 'Javascript' },
                              { name: 'Python' },
                              { name: 'HTML' }])

tests = Test.create([{ title: 'OOP', category_id: 1 },
                     { title: 'React', level: 4, category_id: 2 },
                     { title: 'Big Data', level: 3, category_id: 3 },
                     { title: 'Bootstrap', level: 2, category_id: 4 },
                     { title: 'Metaprogramming', category_id: 1 }])

users = User.create([{ name: 'Student1' },
                     { name: 'Student2' }])

questions = Question.create([{ body: 'What is a class?', test_id: 1 },
                             { body: 'Component lifecycle', test_id: 2 },
                             { body: 'Grid structure', test_id: 4 }])

answers = Answer.create([{ body: 'Class is an object and object is a class', correct: true, question_id: 1 }]),
          { body: 'ComponentDidMount, ComponentWillMount, etc.', question_id: 3 }

admin = Admin.create(name: 'Jakunin Oleg')

tests_passed = TestPassage.create([{ user_id: 1, test_id: 1 },
                                   { user_id: 1, test_id: 2 },
                                   { user_id: 2, test_id: 3 }])
