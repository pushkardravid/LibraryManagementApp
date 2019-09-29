# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

university = University.create([{name:'North Carolina State University',state:'North Carolina'}])
university = University.create([{name:'University of North Carolina Chapell Hill',state:'North Carolina'}])
university = University.create([{name:'Duke University',state:'North Carolina'}])
university = University.create([{name:'Stanford University',state:'California'}])


library = Library.create([{name:'Hunt Library', location:'Centennial Campus, Raleigh'}])
library = Library.create([{name:'Hill Library', location:'Main Campus, Raleigh'}])
library = Library.create([{name:'OT Library', location:'California'}])
library = Library.create([{name:'SU Library', location:'California'}])
library = Library.create([{name:'Chapell Library', location:'Chapell Hill'}])