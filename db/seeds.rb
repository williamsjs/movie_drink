# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Character.create(name: "Darth Vader", main_image: "darth.jpg")
Character.create(name: "John McClain", main_image: "john.jpg")
Character.create(name: "Man With No Name", main_image: "clint.jpg")

MainQuote.create(quote: "I've been waiting for you, name. We meet again at last. The circle is now complete. When I left you, I was but the learner; now I am the master.", character: Character.find_by_name("Darth Vader"))
MainQuote.create(quote: "Welcome to the party, name!", character: Character.find_by_name("John McClain"))
MainQuote.create(quote: "You see, in this world there's two kinds of people, name: Those with loaded guns and those who dig. You dig." , character: Character.find_by_name("Man With No Name"))

BeerQuote.create(positive: true, character: Character.find_by_name("Darth Vader"), quote: "This is a good beer. Search your feelings, you know it to be true")
BeerQuote.create(positive: true, character: Character.find_by_name("John McClain"), quote: "Happy Trails, bad beer.  This stuff is good")
BeerQuote.create(positive: true, character: Character.find_by_name("Man With No Name"), quote: "When a man with .45 meets a man with a rifle, you said, the man with a pistol's a dead man. Let's see if that's true. Go ahead, load up and shoot for this beer")

BeerQuote.create(positive: false, character: Character.find_by_name("Darth Vader"), quote: "This beer is beaten. It is useless to resist. Don't let yourself be destroyed as Obi-Wan did. ")
BeerQuote.create(positive: false, character: Character.find_by_name("John McClain"), quote: "Eeeh! Sorry Hans, wrong beer. Would you like to go for Double Jeopardy where the scores can really change? ")
BeerQuote.create(positive: false, character: Character.find_by_name("Man With No Name"), quote: "Get three coffins ready. My mistake, four coffins. This beer is nasty")
