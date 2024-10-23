require 'rest-client'
require 'json'
require 'faker'

puts "cleaning database"

Report.destroy_all
Hotel.destroy_all
User.destroy_all
Crime.destroy_all

puts "creating one user"
puts "making crimes"

crimelondon = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.51&lng=-0.14')
crime_london = JSON.parse(crimelondon)

crime_london.each do |crime|
  if crime['month'].nil?
    Crime.create(
      latitude: crime['location']['latitude'],
      longitude: crime['location']['longitude'],
      category: crime['category'],
      date: crime['date'])
  else
    Crime.create(
      latitude: crime['location']['latitude'],
      longitude: crime['location']['longitude'],
      category: crime['category'],
      date: crime['month'])
  end
end

crime1 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.5101&lng=-0.1205')
crime_one = JSON.parse(crime1)

crime_one.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

crimes = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.5074&lng=-0.1272')
crime_two = JSON.parse(crimes)

crime_two.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

crime3 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.5071&lng=-0.1416')
crime_three = JSON.parse(crime3)

crime_three.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=53.4776&lng=-2.2451')
manchester = JSON.parse(manchester_crime)

manchester.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=53.4756&lng=-2.2506')
manchester = JSON.parse(manchester_crime)

manchester.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

nottingham_crime = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-02&lat=52.9545&lng=-1.1549')
nottingham = JSON.parse(nottingham_crime)
nottingham.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

more_london_crime = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-02&lat=53.4756&lng=-2.2506')
london_crime_more = JSON.parse(more_london_crime)
london_crime_more.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

# mores_london_crime = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-02&lat=&lng=-2.2506')
# london_crime_moress = JSON.parse(more_london_crimes)
# london_crime_moress.each do |crime|
#   Crime.create(latitude: crime['location']['latitude'],
#               longitude: crime['location']['longitude'],
#               category: crime['category'],
#               date: crime['month'])
# end




freddy = User.create(email: "freddy@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHGth1GpE34QEwBpZiVsYlDs_wmprjG0WuGA&s")
paul = User.create(email: "paul@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvi7HpQ-_PMSMOFrj1hwjp6LDcI-jm3Ro0Xw&s")
john = User.create(email: "john@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUaHK8aWxPF92QMJwhgPA5KHwyBmpf5VOLpw&s")
mac = User.create(email: "mac@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo0Rd8IZxd0JNv3SkUSqxiYd9_Pa_-bTGS_A&s")
matty = User.create(email: "matty@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkQY77eP40wItgCJ89uDS1OzviJqyERLJQk_MJpXMj_6bg4UyUWsLWZmH0T7fYQHsFtEs&usqp=CAU")
anil = User.create(email: "anil@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM2eLAUZl1zbeDEEe3g_EfCr4sAvt4jhKqA-CZjAhMD7bYpfJ5nXphCa6QYC3yiq8yHyk&usqp=CAU")

puts "Creating hotels..."

puts "creating hotels"


Hotel.create(
  name: "1 Hotel Mayfair",
  address: "3 Berkeley St, London W1J 8DL",
  crime_rating: 3.7,
  image: "https://images.squarespace-cdn.com/content/v1/5e2899ec34f10469ac758b30/74ec924b-6c98-4028-955e-347c46daf700/855832_l.jpeg",
  user: freddy)

Hotel.create(
  name: "Hilton Manchester Deansgate",
  address: "303 Deansgate, Manchester M3 4LQ",
  crime_rating: 4.0,
  image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Beetham_Tower_from_below.jpg/230px-Beetham_Tower_from_below.jpg",
  user: freddy)

Hotel.create(
  name: "The Midland, Manchester",
  address: "16 Peter St, Manchester M60 2DS",
  crime_rating: 3.7,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA3FWUclKOASizlAbnXj0hokE_Um7835LQwg&s",
  user: freddy)

savoy = Hotel.create(
  name: "The Savoy",
  address: "Strand, London WC2R 0EZ",
  crime_rating: 4.5,
  image: "https://www.livingnorth.com/images/media/articles/life-and-style/travel/The%20Savoy/Savoy%201.jpg?",
  user: freddy)

ritz = Hotel.create(
  name: "The Ritz London",
  address: "150 Piccadilly, London W1J 9BR",
  crime_rating: 4.7,
  image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/09/b6/ea/the-ritz-london-exterior.jpg?w=700&h=-1&s=1",
  user: paul
)
claridges = Hotel.create(
  name: "Claridge's",
  address: "Brook St, London W1K 4HR",
  crime_rating: 4.6,
  image: "https://www.claridges.co.uk/globalassets/claridges.jpg",
  user: anil
)

corinthia_london = Hotel.create(
  name: "Corinthia London",
  address: "Whitehall Pl, London SW1A 2BD",
  crime_rating: 4.0,
  image: "https://lh5.googleusercontent.com/p/AF1QipP_uY10v9kXsLC5L75rTqmCLUwe3XaBBHQwXUWA=w253-h168-k-no",
  user: matty
)

nox_kensington = Hotel.create(
  name: "NOX Kensington",
  address: "88 Holland Rd, London W14 8BN",
  crime_rating: 4.0,
  image: "https://lh3.googleusercontent.com/p/AF1QipOjXkZ5yNP0iPbqRprZtutHpFav-B7vt_ti0PfY=s1360-w1360-h1020",
  user: mac
)

puts "Creating fake reports.."

Report.create(
    comment:  "It was a super safe area! Would recommend.",
    safety_rating: 5,
    hotel: savoy,
    user: john
)

Report.create(
  comment:  "Area had some issues with shoplifting, make sure you stay aware",
  safety_rating: 3,
  hotel: savoy,
  user: paul
)

Report.create(
  comment:  "Felt safe during the day and late at night!",
  safety_rating: 4,
  hotel: savoy,
  user: freddy
)

Report.create(
  comment:  "Great area, although a few dogdy people were roaming the streets at night",
  safety_rating: 3,
  hotel: savoy,
  user: mac
)

Report.create(
  comment:  "Super safe area, locals are friendly and respectful",
  safety_rating: 5,
  hotel: claridges,
  user: matty
)


Report.create(
  comment:  "Great Hotel and didn't have any issues and felt safe at all times",
  safety_rating: 5,
  hotel: claridges,
  user: anil
)
puts "Done!"
