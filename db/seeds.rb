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

london_crime1 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.5101&lng=-0.1205')
crime_one = JSON.parse(london_crime1)

crime_one.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

london_crime2 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.5074&lng=-0.1272')
crime_two = JSON.parse(london_crime2)

crime_two.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

london_crime3 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=51.5071&lng=-0.1416')
crime_three = JSON.parse(london_crime3)

crime_three.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime1 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=53.4776&lng=-2.2451')
crime1 = JSON.parse(manchester_crime1)

crime1.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime2 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-01&lat=53.4756&lng=-2.2506')
manchester2 = JSON.parse(manchester_crime2)

manchester2.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime3 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2024-02&lat=52.9545&lng=-1.1549')
manchester3 = JSON.parse(manchester_crime3)
manchester3.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime4 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2023-02&lat=53.4756&lng=-2.2506')
manchester4 = JSON.parse(manchester_crime4)


manchester4.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end

manchester_crime5 = RestClient.get('https://data.police.uk/api/crimes-at-location?date=2023-02&lat=53.4776&lng=-2.2451')
manchester5 = JSON.parse(manchester_crime5)
manchester5.each do |crime|
  Crime.create(latitude: crime['location']['latitude'],
              longitude: crime['location']['longitude'],
              category: crime['category'],
              date: crime['month'])
end




freddy = User.create(email: "freddy@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHGth1GpE34QEwBpZiVsYlDs_wmprjG0WuGA&s")
paul = User.create(email: "paul@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvi7HpQ-_PMSMOFrj1hwjp6LDcI-jm3Ro0Xw&s")
john = User.create(email: "john@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUaHK8aWxPF92QMJwhgPA5KHwyBmpf5VOLpw&s")
mac = User.create(email: "mac@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo0Rd8IZxd0JNv3SkUSqxiYd9_Pa_-bTGS_A&s")
matty = User.create(email: "matty@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkQY77eP40wItgCJ89uDS1OzviJqyERLJQk_MJpXMj_6bg4UyUWsLWZmH0T7fYQHsFtEs&usqp=CAU")
anil = User.create(email: "anil@123.com", password: "123123", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM2eLAUZl1zbeDEEe3g_EfCr4sAvt4jhKqA-CZjAhMD7bYpfJ5nXphCa6QYC3yiq8yHyk&usqp=CAU")

puts "Creating hotels..."

puts "creating hotels"

Hotel.create(
  name: "INNSIDE by Meliá Manchester",
  address: "1 First St, Manchester M15 4RP",
  crime_rating: 4.2,
  image: "https://lh3.googleusercontent.com/p/AF1QipNDawulHDoGRtjSg1jpGvdC1eI3CTW2ASc8UdS9=s1360-w1360-h1020",
  user: freddy
)

Hotel.create(
  name: "DoubleTree by Hilton Hotel Manchester",
  address: "One Piccadilly, Auburn St, Manchester M1 3DG",
  crime_rating: 3.9,
  image: "https://lh3.googleusercontent.com/p/AF1QipNNGp6DNEW5dPiFjRA-EQ8pN4Yq1HguDWBKd5vb=s1360-w1360-h1020",
  user: freddy
)

Hotel.create(
  name: "Hotel Brooklyn Manchester",
  address: "59 Portland St, Manchester M1 3HP",
  crime_rating: 4.0,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqlVHxq6vHrFDp2zl0IzvcS1IIg8j9HLuLEA&s",
  user: freddy
)

Hotel.create(
  name: "Holiday Inn Manchester",
  address: "25 Aytoun St, Manchester M1 3AE",
  crime_rating: 3.9,
  image: "https://www.himanchestercity.com/main/b82a0cac-8748-47d6-9153-cf2318355a49.webp",
  user: freddy
)

Hotel.create(
  name: "Manchester Piccadilly Hotel",
  address: "91 London Rd, Manchester M1 2PG",
  crime_rating: 4.0,
  image: "https://images.trvl-media.com/lodging/1000000/40000/34400/34337/3b556711.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill",
  user: freddy
)

Hotel.create(
  name: "The Lowry Hotel",
  address: "50 Dearmans Pl, Salford, Manchester M3 5LH",
  crime_rating: 4.5,
  image: "https://ik.imgkit.net/3vlqs5axxjf/external/ik-seo/https://media.iceportal.com/137021/photos/76609541_XL/The-Lowry-Hotel-Exterior.jpg?tr=w-780%2Ch-437%2Cfo-auto",
  user: freddy
)

Hotel.create(
  name: "Malmaison Manchester",
  address: "1-3 Piccadilly, Manchester M1 3AQ",
  crime_rating: 4.0,
  image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/8f/e1/b8/exterior-hotel.jpg?w=700&h=-1&s=1",
  user: freddy
)

Hotel.create(
  name: "Radisson Blu Edwardian Manchester",
  address: "Peter St, Manchester M2 5GP",
  crime_rating: 4.3,
  image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/30/df/81/exterior.jpg?w=700&h=-1&s=1",
  user: freddy
)

Hotel.create(
  name: "The Townhouse Hotel Manchester",
  address: "101 Portland St, Manchester M1 6DF",
  crime_rating: 4.1,
  image: "https://image-tc.galaxy.tf/wijpeg-bhv4lsk14qhbqu6fs3hjj4y87/gh-l-townhouse-hotel-i3d-0294.jpg?width=1920",
  user: freddy
)

Hotel.create(
  name: "Novotel Manchester Centre",
  address: "21 Dickinson St, Manchester M1 4LX",
  crime_rating: 3.8,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTifFAmkHBbWHwI1ZMeE9vKbws-xCHx650wMg&s",
  user: freddy
)

Hotel.create(
  name: "Premier Inn Manchester City Centre",
  address: "7 Dale St, Manchester M1 1JA",
  crime_rating: 3.6,
  image: "https://www.premierinn.com/content/dam/pi/websites/hotelimages/gb/en/M/MANSPI/manchester-city-centre-west-external.jpg",
  user: freddy
)

Hotel.create(
  name: "Hyatt Regency Manchester",
  address: "55 Booth St W, Manchester M15 6PQ",
  crime_rating: 4.2,
  image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/b9/1d/11/exterior.jpg?w=700&h=-1&s=1",
  user: freddy
)

Hotel.create(
  name: "Crowne Plaza Manchester",
  address: "70 Shudehill, Manchester M4 4AF",
  crime_rating: 3.9,
  image: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/266810635.jpg?k=9117bb92a847cedad1e8f6621cbba4bcca1e4533d165a5828e2d4e08dbe053a1&o=&hp=1",
  user: freddy
)

Hotel.create(
  name: "AC Hotel by Marriott Manchester",
  address: "17-19 Trafford Rd, Salford, Manchester M5 3AW",
  crime_rating: 4.1,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4b0YgVOOX1WenkLXaHftK0ifts8h8DehcqA&s",
  user: freddy
)

Hotel.create(
  name: "Hotel Football Old Trafford",
  address: "99 Sir Matt Busby Way, Manchester M16 0SZ",
  crime_rating: 3.7,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuvL9onFdcqRWNqbyOVr1ouFHwAs0dyfvNUg&s",
  user: freddy
)

Hotel.create(
  name: "Clayton Hotel Manchester City Centre",
  address: "55 Portland St, Manchester M1 3HP",
  crime_rating: 3.8,
  image: "https://lovebelfast.co.uk/wp-content/uploads/2022/01/Clayton-Manchester-City-Centre-with-GM-Filiz-Smith-C.jpg",
  user: freddy
)

Hotel.create(
  name: "The Ainscow Hotel",
  address: "Trinity Way, Manchester M3 5EN",
  crime_rating: 3.9,
  image: "https://dm1igrl0afsra.cloudfront.net/AcuCustom/Sitename/DAM/053/8e6hiF3kQL2rdRyGCpqY.jpg",
  user: freddy
)

Hotel.create(
  name: "YOTEL Manchester Deansgate",
  address: "John Dalton House, 2 John Dalton St, Manchester M2 6JR",
  crime_rating: 4.0,
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS80WEmpxrurYkfwmwA3pvRpTp8NZDY3dtMaQ&s",
  user: freddy
)

Hotel.create(
  name: "Voco Manchester",
  address: "59 Portland St, Manchester M1 3HP",
  crime_rating: 3.2,
  image: "https://lh5.googleusercontent.com/p/AF1QipOZRO8C5AXyBzmFwCWp33oEYd4bbpYEh2D_Id3e=w253-h142-k-no",
  user: freddy)

Hotel.create(
  name: "Dakota Hotel Manchester",
  address: "29 Ducie St, Manchester M1 2JL",
  crime_rating: 3.0,
  image: "https://lh5.googleusercontent.com/p/AF1QipN5S4D3Yk1ZgyQ30gWQzeaChSXdO4F_mGMpC2U8=w253-h316-k-no",
  user: freddy)

Hotel.create(
  name: "Hotel Gotham Manchester",
  address: "100 King St, Manchester M2 4WU",
  crime_rating: 3.5,
  image: "https://lh5.googleusercontent.com/p/AF1QipNQvYg9QUJEYTOttb4DbJXja6-zR-Zf4FZAYQEx=w253-h336-k-no",
  user: freddy)

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
