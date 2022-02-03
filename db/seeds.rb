# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{name: 'Alex', age: 23},
	                 {name: 'Dmitry', age: 45}, 
	                 {name: 'Pavel', age: 15}])

categories = Category.create([{title: 'Geografy'},
                              {title: 'History'},
                              {title: 'Matematika'}])

tests = Test.create([{title: 'Test 1', level: 2, category: categories.first},
                     {title: 'Test 2', level: 3, category: categories.last}
                     {title: 'Test 3', level: 2, category: categories[1]}
                     {title: 'Test 4', level: 3, category: categories.last}
                     {title: 'Test 5', level: 1, category: categories.first}
                   ])
