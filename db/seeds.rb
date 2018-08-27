# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def distance loc1, loc2
  rad_per_deg = Math::PI/180  # PI / 180
  rkm = 6371                  # Earth radius in kilometers
  rm = rkm * 1000             # Radius in meters

  dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
  dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

  lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
  lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

  a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  rm * c # Delta in meters
end

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
  phone: "510-535-5602",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/84TzxwmLH-oVRrn4tmh4aA/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

har = {
  email: "har@gmail.com",
  name: "Hopalong Animal Rescue",
  location: "Oakland, CA 94606",
  phone: "510-267-1915",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/3vWbtlN1NNczSuRiADWO8Q/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

faas = {
  email: "faas@gmail.com",
  name: "Friends of the Alameda Animal Shelter",
  location: "1590 Fortmann Way, Alameda, CA 94501",
  phone: "510-337-8565",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/y5QvJyH1PUVC3u5vD1psuw/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

bacs = {
  email: "bacs@gmail.com",
  name: "Barkeley Animal Care Services",
  location: "1 Bolivar Dr, Berkeley, CA 94710",
  phone: "510-981-6600",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/MLSkooS_0HXmyFGm6AtPcA/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

ebspca = {
  email: "ebspca@gmail.com",
  name: "Easy bay SPCA - Oakland",
  location: "8323 Baldwin St, Oakland, CA 94621",
  phone: "510-569-0702",
  photo: "https://s3-media4.fl.yelpcdn.com/bphoto/JyzRRnkALUBY8DUlCH9kzw/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

has = {
  email: "has@gmail.com",
  name: "Hayward Animal Shelter",
  location: "16 Barnes Ct, Hayward, CA 94544",
  phone: "510-293-7200",
  photo: "https://s3-media3.fl.yelpcdn.com/bphoto/qW23uy2AKWsmsvm_VQVhdQ/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

arf = {
  email: "arf@gmail.com",
  name: "ARF - Tony La Russa's Animal Rescue Foundation",
  location: "2890 Mitchell Dr, Walnut Creek, CA 94598",
  phone: "925-256-1273",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/o3mzvbUykHsvUB-YMo_Sew/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

sfspca = {
  email: "sfspca@gmail.com",
  name: "San Francisco SPCA",
  location: "250 Florida St, San Francisco, CA 94103",
  phone: "415-522-3500",
  photo: "https://s3-media3.fl.yelpcdn.com/bphoto/THlQV3538xektuT2LsTgUw/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

accsf = {
  email: "accsf@gmail.com",
  name: "Animal Care & Control San Francisco",
  location: "1200 15th St, San Francisco, CA 94103",
  phone: "415-554-6364",
  photo: "https://s3-media4.fl.yelpcdn.com/bphoto/ypOoktTORDxECENEyakYhw/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

mas = {
  email: "mas@gmail.com",
  name: "Martinez Animal Shelter",
  location: "4800 Imhoff Pl, Martinez, CA 94553",
  phone: "925-335-8300",
  photo: "https://s3-media4.fl.yelpcdn.com/bphoto/lXGo7zshKWtk8TOldDllaQ/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

hssv = {
  email: "hssv@gmail.com",
  name: "Humane Society Silicon Valley",
  location: "901 Ames Ave, Milpitas, CA 95035",
  phone: "408-262-2133",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/pfkLoUf_fNNi404VICFD3A/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

vhs = {
  email: "vhs@gmail.com",
  name: "Valley Humane Society",
  location: "3670 Nevada St, Pleasanton, CA 94566",
  phone: "925-426-8656",
  photo: "http://arizonacitychamber.com/newsite/images/sobipro/entries/169/thumb_ValleyHumaneLoge.gif",
  password: "123456",
  organization: true,
nonprofit_status: 0}

phs = {
  email: "phs@gmail.com",
  name: "Peninsula Humane Society & SPCA",
  location: "1450 Rollins Rd, Burlingame, CA 94010",
  phone: "650-340-7022",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/BBwkVoVKF1xEKHxrqMpqFw/o.jpg",
  password: "123456",
  organization: true,
nonprofit_status: 0}

jp = {
  email: "shelter@gmail.com",
  name: "Jelly's Place",
  location: "2905 San Pablo Dam Rd, San Pablo, CA 94803",
  phone: "510-621-3493",
  photo: "https://d2g8igdw686xgo.cloudfront.net/24104938_1506117215.5443.jpg",
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
Gucci Iris Jinx Holly April Luna Cadence Cajun Daisy Faith Ruby Eureka Gypsy Alpine Ayrianna Nori Leila Polly Shyla Xena Uma Bits Athena Abby Velvet Vamp Willow Gemini Emma Jag Mack Orion Sterling
Phantom Darth Balboa Ajax Wrigley Titan Yoyo Zulu Jake Champion Loki Punch Hiro Attila Storm
Bailey Max Charlie Buddy Rocky Jake Jack Toby Cody Buster Bella Lucy Molly Daisy Maggie Sophie Sadie Chloe)
BREEDS = ["German Shepherd", "Labrador Retriever", "Bulldog", "Beagle", "Poodle", "Golden Retriever", "Corgi", "Shiba Inu", "Akita", "Chow Chow", "Rottwelier", "Boxer", "Siberian Husky", "Dobermann", "Great Dane", "Pug", "Border Collie", "Terrier", "Cocker Spaniel"]
BREED_PHOTOS = ["germanshepherd.jpg", "labradorretriever.jpg", "bulldog.jpg", "beagle.jpg", "poodle.jpg", "goldenretriever.jpg", "corgi.jpg", "shibainu.jpg", "akita.jpg", "chowchow.jpg", "rottweiler.jpg", "boxer.jpg", "husky.jpg", "dobermann.jpg", "greatdane.PNG", "pug.jpg", "bordercollie.jpg", "terrier.jpg", "cockerspaniel.jpg"]
60.times do
  breed = BREEDS.sample
  dog_name = DOG_NAME.sample
  DOG_NAME.delete(dog_name)
  Dog.create!(photo: "#{BREED_PHOTOS[BREEDS.index(breed)]}", name: dog_name, breed: breed, user_id: shelters.sample.id, size: ["S", "M", "L"].sample, age: (1..144).to_a.sample, gender: ["Male", "Female"].sample)
end

puts "Created #{Dog.count} Dogs!"


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
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,8,31,(12..20).to_a.sample,(1..59).to_a.sample), status: "Requested")
    pickup_results = Geocoder.search(req.pickup_location)
    pickup_lat = pickup_results.first.geometry["location"]["lat"]
    pickup_long = pickup_results.first.geometry["location"]["lng"]
    dropoff_results = Geocoder.search(req.dropoff_location)
    dropoff_lat = dropoff_results.first.geometry["location"]["lat"]
    dropoff_long = dropoff_results.first.geometry["location"]["lng"]
    req.distance = (distance [pickup_lat, pickup_long], [dropoff_lat, dropoff_long])*0.000621371
    early_reqs << req
  else
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,(9..12).to_a.sample,(1..30).to_a.sample,(8..20).to_a.sample,(1..59).to_a.sample), status: "Requested" )
    pickup_results = Geocoder.search(req.pickup_location)
    pickup_lat = pickup_results.first.geometry["location"]["lat"]
    pickup_long = pickup_results.first.geometry["location"]["lng"]
    dropoff_results = Geocoder.search(req.dropoff_location)
    dropoff_lat = dropoff_results.first.geometry["location"]["lat"]
    dropoff_long = dropoff_results.first.geometry["location"]["lng"]
    req.distance = (distance [pickup_lat, pickup_long], [dropoff_lat, dropoff_long])*0.000621371
  end
  i += 1

  dog_count = shelter.dogs.count
  num_counter = 0
  dog_array = (0...dog_count).to_a
  request_count = (1..3).to_a.sample
  arr = []
  while num_counter < dog_count && num_counter < request_count
    ind = dog_array.sample
    dog_array.delete(ind)
    arr << shelter.dogs[ind]
    num_counter += 1
  end

  req.dogs = arr
  req.save

  if req.dogs.count == 0
    req.destroy
  end
end

a = Request.count

puts "Created #{Request.count} Requests!"
i = 0
15.times do
  shelter = shelters.sample
  dropoff = shelter.location
  pickup = addresses.sample
  if i < 8
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,8,31,(12..20).to_a.sample,(1..59).to_a.sample), status: "Requested")
    pickup_results = Geocoder.search(req.pickup_location)
    pickup_lat = pickup_results.first.geometry["location"]["lat"]
    pickup_long = pickup_results.first.geometry["location"]["lng"]
    dropoff_results = Geocoder.search(req.dropoff_location)
    dropoff_lat = dropoff_results.first.geometry["location"]["lat"]
    dropoff_long = dropoff_results.first.geometry["location"]["lng"]
    req.distance = (distance [pickup_lat, pickup_long], [dropoff_lat, dropoff_long])*0.000621371
    early_reqs << req
  else
    req = Request.create!(user_id: shelter.id, pickup_location: pickup, dropoff_location: dropoff, datetime: DateTime.new(2018,(9..12).to_a.sample,(1..30).to_a.sample,(8..20).to_a.sample,(1..59).to_a.sample), status: "Requested" )
    pickup_results = Geocoder.search(req.pickup_location)
    pickup_lat = pickup_results.first.geometry["location"]["lat"]
    pickup_long = pickup_results.first.geometry["location"]["lng"]
    dropoff_results = Geocoder.search(req.dropoff_location)
    dropoff_lat = dropoff_results.first.geometry["location"]["lat"]
    dropoff_long = dropoff_results.first.geometry["location"]["lng"]
    req.distance = (distance [pickup_lat, pickup_long], [dropoff_lat, dropoff_long])*0.000621371
  end
  i += 1

  dog_count = shelter.dogs.count
  num_counter = 0
  dog_array = (0...dog_count).to_a
  request_count = (1..3).to_a.sample
  arr = []
  while num_counter < dog_count && num_counter < request_count
    ind = dog_array.sample
    dog_array.delete(ind)
    arr << shelter.dogs[ind]
    num_counter += 1
  end

  req.dogs = arr
  req.save

  if req.dogs.count == 0
    req.destroy
  end

end

puts "Created #{Request.count - a} Requests!"

early_req_array = (0...early_reqs.count).to_a
8.times do
  num = early_req_array.sample
  early_req_array.delete(num)
  Booking.create!(user_id: drivers.sample.id, request_id: early_reqs[num].id)
end

puts "Created #{Booking.count} bookings!"
