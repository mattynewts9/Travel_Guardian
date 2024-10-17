puts "cleaning database"

Hotel.destroy_all
User.destroy_all

puts "creating one user"

freddy = User.create(email: "freddy@123.com", password: "123123")
paul = User.create(email: "paul@123.com", password: "123123")
john = User.create(email: "john@123.com", password: "123123")


puts "creating 3 hotels"

Hotel.create(
    name: "The Savoy",
    address: "Strand, London WC2R 0EZ",
    crime_rating: 4.5,
    image: "https://www.livingnorth.com/images/media/articles/life-and-style/travel/The%20Savoy/Savoy%201.jpg?",
    user: freddy)

Hotel.create(
    name: "The Ritz London",
    address: "150 Piccadilly, London W1J 9BR",
    crime_rating: 4.7,
    image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/09/b6/ea/the-ritz-london-exterior.jpg?w=700&h=-1&s=1",
    user: paul
)
Hotel.create(
    name: "Claridge's",
    address: "Brook St, London W1K 4HR",
    crime_rating: 4.6,
    image: "https://www.claridges.co.uk/globalassets/claridges.jpg",
    user: john
)

puts "done"
