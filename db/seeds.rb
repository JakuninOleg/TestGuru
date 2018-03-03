# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Создаем Админа'
admin = Admin.create(name: 'Jakunin Oleg')
p 'Админ создан'

p 'Создаем Категории'
categories = Category.create([{ name: 'Ruby' },
                              { name: 'Javascript' },
                              { name: 'Python' },
                              { name: 'HTML' }])
p 'Категории созданы'

p 'Создаем Тесты'
tests = Test.create([{ title: 'OOP', category: categories.first, admin: admin },
             { title: 'React', level: 4, category: categories[1], admin: admin },
             { title: 'Bootstrap', level: 0, category: categories[3], admin: admin },
             { title: 'Metaprogramming', level: 5, category: categories.first, admin: admin },
             { title: 'Rails', level: 6, category: categories.first, admin: admin }])
p 'Тесты созданы'

p 'Создаём вопросы'
questions = Question.create([{ body: 'What is a class?', test: tests.first },
                             { body: 'How to inherit from another class?', test: tests.first },
                             { body: 'Component lifecycle', test: tests[1] },
                             { body: 'Instrument to make native apps with React', test: tests[1] },
                             { body: 'What is metaprogramming?', test: tests[3] },
                             { body: 'Grid structure', test: tests[2] },
                             { body: 'How to delete database?', test: tests.last }])
p 'Вопросы созданы'

p 'Создаем ответы'
Answer.create([{ body: 'Class is an object and object is a class', correct: true,               question: questions.first },
               { body: 'ComponentDidMount, ComponentWillMount, etc.', question: questions[2] },
               { body: 'Using < symbol', correct: true, question: questions[1] },
               { body: 'React Native', correct: true, question: questions[3] },
               { body: 'Some magic', question: questions[4] },
               { body: '12-column layout', correct: true, question: questions[5] },
               { body: 'rails db:drop', correct: true, question: questions[6] }])
p 'Ответы созданы'

users = User.create([{ name: 'Student1', email: 'student1@gmail.com' },
             { name: 'Student2', email: 'student2@gmail.com' }])

TestPassage.create([{ user: users.first, test: tests.first },
                    { user: users.first, test: tests[1] },
                    { user: users.last, test: tests[4] }])
