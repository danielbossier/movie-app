# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
actor = Actor.new({ first_name: "Benedict", last_name: "Cumberbatch", known_for: "Sherlock" })
actor.save

actor = Actor.new({ first_name: "Kit", last_name: "Harrington", known_for: "Game of Thrones" })
actor.save

movie = Movie.new({ title: "Goodfellas", year: 1990, plot: "All Henry's life he wanted to be a ganster. Too bad it involves a lot of burried bodies and cocaine." })

movie = Movie.new({ title: "Jaws", year: 1975, plot: "They could have used a bigger boat." })
