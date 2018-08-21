# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NAME = %w(George Matt Larry Kat Ableen Takuma Nozomi David Douglas Hiroki)
loc = ["2096 Mountain Blvd, Oakland, CA 94611, USA"]
loc << "3250 Lakeshore Ave, Oakland, CA 94610, USA"
loc << "555 Willie Stargell Ave, Alameda, CA 94501, USA"
loc << "600 Guerrero St, San Francisco, CA 94110, USA"
loc << "Sloat Blvd & Great Highway, San Francisco, CA 94132, USA"
loc << "720 Dubuque Ave, South San Francisco, CA 94080, USA"
loc << "500 Ludeman Ln, Millbrae, CA 94030, USA"
loc << "3000 Newell Dr, American Canyon, CA 94503, USA"
loc << "49 Sky Oaks Rd, Fairfax, CA 94930, USA"
loc << "35201 Newark Blvd V, Newark, CA 94560, USA"
drivers = []
i = 0


10.times do
  user_name = NAME.sample
  NAME.delete(user_name)
  drivers << User.create!(email: "#{user_name}@gmail.com",
                          name: user_name,
                          location: "#{loc[i]}",
                          password: "123456",
                          organization: false,
                          nonprofit_status: 1
                          )
  i+=1
end
a = User.count
puts "Created #{User.count} Users!"

oas = {
  email: "oas@gmail.com",
  name: "Oakland Animal Shelter",
  location: "1101 29th Ave, Oakland, CA 94601",
  phone: "5105355602",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/sQN-rGrXxL8SS6yMvV51EQ/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

har = {
  email: "har@gmail.com",
  name: "Hopalong Animal Rescue",
  location: "Oakland, CA 94606",
  phone: "5102671915",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/rAe2jFywhnhgLpvuoUf-cA/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

faas = {
  email: "faas@gmail.com",
  name: "Friends of the Alameda Animal Shelter",
  location: "1590 Fortmann Way, Alameda, CA 94501",
  phone: "5103378565",
  photo: "https://s3-media3.fl.yelpcdn.com/bphoto/oAOEyjZ2fdl_gyj9zxgNoA/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

bacs = {
  email: "bacs@gmail.com",
  name: "Barkeley Animal Care Services",
  location: "1 Bolivar Dr, Berkeley, CA 94710",
  phone: "5109816600",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/44ul_bjPgyZKUxEoppd_yg/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

ebspca = {
  email: "ebspca@gmail.com",
  name: "Easy bay SPCA - Oakland",
  location: "8323 Baldwin St, Oakland, CA 94621",
  phone: "5105690702",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/cNaNsvKUrRaoYMSgKtdXPA/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

has = {
  email: "has@gmail.com",
  name: "Hayward Animal Shelter",
  location: "16 Barnes Ct, Hayward, CA 94544",
  phone: "5102937200",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/Ks45GWgbaQx8xx5tTouuEQ/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

arf = {
  email: "arf@gmail.com",
  name: "ARF - Tony La Russa's Animal Rescue Foundation",
  location: "2890 Mitchell Dr, Walnut Creek, CA 94598",
  phone: "9252561273",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/K42hzDxxlUsZPAXdmhRMzA/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

sfspca = {
  email: "sfspca@gmail.com",
  name: "San Francisco SPCA",
  location: "250 Florida St, San Francisco, CA 94103",
  phone: "4155223500",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/AZ8rxs1DQU25cigbNV9UkA/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

accsf = {
  email: "accsf@gmail.com",
  name: "Animal Care & Control San Francisco",
  location: "1200 15th St, San Francisco, CA 94103",
  phone: "4155546364",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/nRZ4eUbAgasGFpYynA_qiw/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

mas = {
  email: "mas@gmail.com",
  name: "Martinez Animal Shelter",
  location: "4800 Imhoff Pl, Martinez, CA 94553",
  phone: "9253358300",
  photo: "https://s3-media4.fl.yelpcdn.com/bphoto/KZFZroeX7FvR8HuTmkwyeA/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

hssv = {
  email: "hssv@gmail.com",
  name: "Humane Society Silicon Valley",
  location: "901 Ames Ave, Milpitas, CA 95035",
  phone: "4082622133",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/GgeFpraxBSlUiSaToADgXg/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

vhs = {
  email: "vhs@gmail.com",
  name: "Valley Humane Society",
  location: "3670 Nevada St, Pleasanton, CA 94566",
  phone: "9254268656",
  photo: "https://s3-media3.fl.yelpcdn.com/bphoto/C1IieJzDKNG7NlRZhqaJmQ/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

phs = {
  email: "phs@gmail.com",
  name: "Peninsula Humane Society & SPCA",
  location: "1450 Rollins Rd, Burlingame, CA 94010",
  phone: "6503407022",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/fGjdeot5NRwDPpdnfNEOaw/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

jp = {
  email: "shelter@gmail.com",
  name: "Jelly's Place",
  location: "2905 San Pablo Dam Rd, San Pablo, CA 94803",
  phone: "5106213493",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/-jkJfIlWcqiNhb7SJuAR9Q/90s.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

s1 = User.create!(oas)
s2 = User.create!(har)
s3 = User.create!(faas)
s4 = User.create!(bacs)
s5 = User.create!(ebspca)
s6 = User.create!(has)
s7 = User.create!(arf)
s8 = User.create!(sfspca)
s9 = User.create!(accsf)
s10 = User.create!(mas)
s11 = User.create!(hssv)
s12 = User.create!(vhs)
s13 = User.create!(phs)
s14 = User.create!(jp)

shelters = [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14]

puts "Created #{User.count - a} Shelters"

DOG_NAME = %w(Coco Lucky Archie Ace Herman Rex Wolf Stein Stephen Toby Lucy Lola Zoe Molly Sophie Cooper Dexter Buddy Stella Bailey Otto
Gucci Iris Jinx Holly April Luna Cadence Cajun Daisy Faith Ruby Eureka Gypsy Alpine Ayrianna Nori Leila Polly Shyla Xena Uma Bits Athena Abby Velvet Vamp Willow Gemini Emma Jag Mack Orion Sterling Phantom Darth Balboa Ajax Wrigley Titan Yoyo Zulu Jake Champion Loki Punch Hiro Attila Storm)
BREEDS = ["German Shepherd", "Labrador Retriever", "Bulldog", "Beagle", "Poodle", "Golden Retriever", "Corgi", "Shiba Inu", "Akita", "Chow Chow", "Rottwelier", "Boxer", "Siberian Husky", "Dobermann", "Great Dane"]
60.times do
  dog_name = DOG_NAME.sample
  DOG_NAME.delete(dog_name)
  Dog.create!(name: dog_name, breed: BREEDS.sample, user_id: shelters.sample.id, size: ["S", "M", "L"].sample, age: (1..144).to_a.sample, gender: ["Male", "Female"].sample)
end


addresses = []
addresses << "3335 Grand Ave, Oakland, CA 94610"
addresses << "2661 Blanding Ave, Alameda, CA 94501"
addresses << "4203 MacArthur Blvd, Oakland, CA 94619"
addresses << "3436 Dimond Ave, Oakland, CA 94602"
addresses << "308 Jackson St, Oakland, CA 94607"
addresses << "710 E 14th St, San Leandro, CA 94577"
addresses << "3535 Hollis St, Emeryville, CA 94608"
addresses << "2220 Mountain Blvd, Oakland, CA 94611"
addresses << "27451 Hesperian Blvd, Hayward, CA 94545"
addresses << "3701 Geary Blvd, San Francisco, CA 94118"
addresses << "6398 Telegraph Ave, Oakland, CA 94609"
addresses << "3868 Piedmont Ave, Oakland, CA 94611"
addresses << "5791 Christie Ave, Emeryville, CA 94608"
addresses << "3385 Castro Valley Blvd, Castro Valley, CA 94546"
addresses << "3610 Mt Diablo Blvd, Lafayette, CA 94549"
addresses << "32160 Dyer St, Union City, CA 94587"
addresses << "388 Park St, Moraga, CA 94556"
addresses << "3300 Lakeshore Blvd, Oakland, CA 94610"
addresses << "1036 Hyde St, San Francisco, CA 94109"
addresses << "265 Davis St, San Leandro, CA 94577"
addresses << "777 Santa Cruz Ave, Menlo Park, CA 94025"
addresses << "960 San Pablo Ave, Albany, CA 94706"
addresses << "1625 Palmetto Ave, Pacifica, CA 94044"
addresses << "2310 S Shores Ctr, Alameda, CA 94501"
addresses << "2162 Railroad Ave, Hercules, CA 94547"
addresses << "1531 San Pablo Ave, Berkeley, CA 94702"
addresses << "2550 Judah St, San Francisco, CA 94122"
addresses << "4814 Broadway, Oakland, CA 94611"
addresses << "501 Paso Nogal Rd, Pleasant Hill, CA 94523"
addresses << "Westline Dr At Otis Dr, Alameda, CA 94501"
addresses << "24 Buchanan St, Albany, CA 94710"
addresses << "1801 E 3rd Ave, San Mateo, CA 94401"
addresses << "Campus Dr Off Keller Ave, Oakland, CA 94620"
addresses << "35 W Orange Ave, South San Francisco, CA 94080"
addresses << "1800 Hearst Ave, Berkeley, CA 94703"
addresses << "1025 La Gonda Way, Danville, CA 94526"
addresses << "400 Hampton Rd, Hayward, CA 94541"
addresses << "Leimert And Bridgeview, Oakland, CA 94602"
addresses << "Main St At Atlantic Ave, Alameda, CA 94501"
addresses << "2701 Isabel St, Richmond, CA 94808"
addresses << "3590 Sanborn Dr, Oakland, CA 94602"



i = 0
early_reqs = []
15.times do
  shelter = shelters.sample
  pickup = shelter.location
  dropoff = addresses.sample

  if i < 8
    i += 1
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,8,31,(12..20).to_a.sample,(1..59).to_a.sample), status: "Requested")
    early_reqs << req
  else
    i += 1
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,(9..12).to_a.sample,(1..30).to_a.sample,(8..20).to_a.sample,(1..59).to_a.sample), status: "Requested" )
  end


  dog_count = shelter.dogs.count
  i = 0
  dog_array = (0...dog_count).to_a
  request_count = (1..3).to_a.sample
  while i < dog_count && i < request_count
    ind = dog_array.sample
    dog_array.delete_at(ind)
    DogRequest.create!(request_id: req.id, dog_id: shelter.dogs[ind].id)
    i += 1
  end
  if req.dog_requests.count == 0
    req.destroy
  end

end

a = Request.count
b = DogRequest.count

puts "Created #{Request.count} Requests!"
puts "Created #{DogRequest.count} Dog Requests!"
i = 0
15.times do
  shelter = shelters.sample
  dropoff = shelter.location
  pickup = addresses.sample
  if i < 8
    i += 1
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,8,31,(12..20).to_a.sample,(1..59).to_a.sample), status: "Requested")
    early_reqs << req
  else
    i += 1
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,(9..12).to_a.sample,(1..30).to_a.sample,(8..20).to_a.sample,(1..59).to_a.sample), status: "Requested" )
  end

  dog_count = shelter.dogs.count
  i = 0
  dog_array = (0...dog_count).to_a
  request_count = (1..3).to_a.sample
  while i < dog_count && i < request_count
    ind = dog_array.sample
    dog_array.delete_at(ind)
    DogRequest.create!(request_id: req.id, dog_id: shelter.dogs[ind].id)
    i += 1
  end
  if req.dog_requests.count == 0
    req.destroy
  end
end

puts "Created #{Request.count - a} Requests!"
puts "Created #{DogRequest.count - b} Dog Requests!"

early_req_array = (0...early_reqs.count).to_a
8.times do
  num = early_req_array.sample
  early_req_array.delete(num)
  Booking.create!(user_id: drivers.sample.id, request_id: early_reqs[num].id)
end

puts "Created #{Booking.count} bookings!"
