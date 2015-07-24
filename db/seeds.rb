# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

darth = Character.create(name: "Darth Vader")
john = Character.create(name: "John McClain")
blondie = Character.create(name: "Man With No Name", main_image: "clint.jpg")

MainQuote.create(quote: "I've been waiting for you, name. We meet again at last. The circle is now complete. When I left you, I was but the learner; now I am the master.", character: darth)
MainQuote.create(quote: "Welcome to the party, name!", character: john)
MainQuote.create(quote: "You see, in this world there's two kinds of people, name: Those with loaded guns and those who dig. You dig." , character: blondie)
