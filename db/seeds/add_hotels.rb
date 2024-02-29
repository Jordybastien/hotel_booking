# Ref: https://en.wikipedia.org/wiki/List_of_largest_hotels

hotels = [
  { name: "Burj Al Arab", city: "Dubai" },
  { name: "The Plaza Hotel", city: "New York City" },
  { name: "Raffles Singapore", city: "Malaysia" },
  { name: "The Ritz-Carlton", city: "Oslo" },
  { name: "The Venetian Resort Hotel Casino", city: "Las Vegas" },
  { name: "The Oberoi Udaivilas", city: "Kampala" },
  { name: "Giraffe Manor", city: "Nairobi" },
  { name: "Icehotel", city: "Oslo" },
  { name: "Palacio Estoril Hotel", city: "Lisob" },
  { name: "Manderley Cottage", city: "London" },
  { name: "Serena Hotel", city: "Kigali" },
  { name: "Marriot Hotel", city: "Kigali" },
]

# Inspired by Airbnb
images_pool = [
  "https://a0.muscache.com/im/pictures/miso/Hosting-765803775581031358/original/1d28b2a8-9520-421b-9288-c94330d1215d.jpeg",
  "https://a0.muscache.com/im/pictures/b3e3601f-e3f7-4825-b505-895043b9e783.jpg",
  "https://a0.muscache.com/im/pictures/a70fb4c3-f419-48bf-b7f1-945b586077bf.jpg",
  "https://a0.muscache.com/im/pictures/miso/Hosting-645296454281775108/original/0f239c43-72fc-44b1-b917-902bc9f4f9e1.jpeg",
  "https://a0.muscache.com/im/pictures/miso/Hosting-710813035837675236/original/759749cc-ba43-48b5-a958-0ae3d5851f70.jpeg",
  "https://a0.muscache.com/im/pictures/miso/Hosting-54061874/original/1ddc158f-c662-4014-a8da-50853ec3fedc.jpeg",
  "https://a0.muscache.com/im/pictures/miso/Hosting-852441565106208849/original/35039868-f966-4cd6-b12a-d42612535dc2.jpeg",
  "https://a0.muscache.com/im/pictures/miso/Hosting-933905859807901976/original/2f0a2ce3-4a9d-4a1e-b2c9-5d816bc0d18d.jpeg",
  "https://a0.muscache.com/im/pictures/833a0f4a-cedf-4299-a825-b877dda986f6.jpg",
  "https://a0.muscache.com/im/pictures/miso/Hosting-901344283804632637/original/5050ff91-f00e-49f1-be0f-b0feeac8fd3d.jpeg"
]

hotels.each do |hotel_attributes|
  hotel = Hotel.create!(hotel_attributes)

  10.times do |i|
    Room.create!(hotel: hotel, price: 100 + i * 10, image_url: images_pool[i])
  end
end
