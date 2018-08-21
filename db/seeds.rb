# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NAME = %w(Caleb Jan Douglas Tsuzumi George Tania Matt Larry Kat Ableen Takuma Nozomi David Maria Hiroki)
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

i = 0
10.times do
  user_name = NAME.sample
  User.create!(email: "#{user_name}@gmail.com",
  name: user_name,
  location: "#{loc[i]}",
  password: "123456",
  organization: false,
  nonprofit_status: 1
   )
  i+=1
end
puts "Created 10 Users!"

oas = {
  email: "oas@gmail.com",
  name: "Oakland Animal Shelter",
  location: "1101 29th Ave, Oakland, CA 94601",
  phone: "5105355602",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/sQN-rGrXxL8SS6yMvV51EQ/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

har = {
  email: "har@gmail.com",
  name: "Hopalong Animal Rescue",
  location: "Oakland, CA 94606",
  phone: "5102671915",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/rAe2jFywhnhgLpvuoUf-cA/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

faas = {
  email: "faas@gmail.com",
  name: "Friends of the Alameda Animal Shelter",
  location: "1590 Fortmann Way, Alameda, CA 94501",
  phone: "5103378565",
  photo: "https://s3-media3.fl.yelpcdn.com/bphoto/oAOEyjZ2fdl_gyj9zxgNoA/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

bacs = {
  email: "bacs@gmail.com",
  name: "Barkeley Animal Care Services",
  location: "1 Bolivar Dr, Berkeley, CA 94710",
  phone: "5109816600",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/44ul_bjPgyZKUxEoppd_yg/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

ebspca = {
  email: "ebspca@gmail.com",
  name: "Easy bay SPCA - Oakland",
  location: "8323 Baldwin St, Oakland, CA 94621",
  phone: "5105690702",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/cNaNsvKUrRaoYMSgKtdXPA/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

has = {
  email: "has@gmail.com",
  name: "Hayward Animal Shelter",
  location: "16 Barnes Ct, Hayward, CA 94544",
  phone: "5102937200",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/Ks45GWgbaQx8xx5tTouuEQ/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

arf = {
  email: "arf@gmail.com",
  name: "ARF - Tony La Russa's Animal Rescue Foundation",
  location: "2890 Mitchell Dr, Walnut Creek, CA 94598",
  phone: "9252561273",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/K42hzDxxlUsZPAXdmhRMzA/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

sfspca = {
  email: "sfspca@gmail.com",
  name: "San Francisco SPCA",
  location: "250 Florida St, San Francisco, CA 94103",
  phone: "4155223500",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/AZ8rxs1DQU25cigbNV9UkA/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

accsf = {
  email: "accsf@gmail.com",
  name: "Animal Care & Control San Francisco",
  location: "1200 15th St, San Francisco, CA 94103",
  phone: "4155546364",
  photo: "https://s3-media1.fl.yelpcdn.com/bphoto/nRZ4eUbAgasGFpYynA_qiw/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

mas = {
  email: "mas@gmail.com",
  name: "Martinez Animal Shelter",
  location: "4800 Imhoff Pl, Martinez, CA 94553",
  phone: "9253358300",
  photo: "https://s3-media4.fl.yelpcdn.com/bphoto/KZFZroeX7FvR8HuTmkwyeA/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

hssv = {
  email: "hssv@gmail.com",
  name: "Humane Society Silicon Valley",
  location: "901 Ames Ave, Milpitas, CA 95035",
  phone: "4082622133",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/GgeFpraxBSlUiSaToADgXg/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

vhs = {
  email: "vhs@gmail.com",
  name: "Valley Humane Society",
  location: "3670 Nevada St, Pleasanton, CA 94566",
  phone: "9254268656",
  photo: "https://s3-media3.fl.yelpcdn.com/bphoto/C1IieJzDKNG7NlRZhqaJmQ/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

phs = {
  email: "phs@gmail.com",
  name: "Peninsula Humane Society & SPCA",
  location: "1450 Rollins Rd, Burlingame, CA 94010",
  phone: "6503407022",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/fGjdeot5NRwDPpdnfNEOaw/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

jp = {
  email: "jp@gmail.com",
  name: "Jelly's Place",
  location: "2905 San Pablo Dam Rd, San Pablo, CA 94803",
  phone: "5106213493",
  photo: "https://s3-media2.fl.yelpcdn.com/bphoto/-jkJfIlWcqiNhb7SJuAR9Q/90s.jpg",
  password: "123456",
  organiation: true,
  nonprofit_status: 0}

User.create!(oas)
User.create!(har)
User.create!(faas)
User.create!(bacs)
User.create!(ebspca)
User.create!(has)
User.create!(arf)
User.create!(sfspca)
User.create!(accsf)
User.create!(mas)
User.create!(hssv)
User.create!(vhs)
User.create!(phs)
User.create!(jp)

puts "Created 14 Shelters"
DOG_NAME = %w(Coco Lucky Archie Ace Herman Rex Wolf Stein Stephen Toby Lucy Lola Zoe Molly Sophie Cooper Dexter Buddy Stella Bailey Otto)
BREEDS = ["German Shepherd", "Labrador Retriever", "Bulldog", "Beagle", "Poodle", "Golden Retriever", "Corgi", "Shiba Inu", "Akita", "Chow Chow", "Rottwelier", "Boxer", "Siberian Husky", "Dobermann", "Great Dane"]
40.times do
  Dogs.create()
end
