# Add some sample hotels and rooms https://en.wikipedia.org/wiki/List_of_largest_hotels
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

hotels.each do |hotel_attributes|
  hotel = Hotel.create!(hotel_attributes)
  # Create 10 rooms with the same price for each hotel
  10.times do |i|
    Room.create!(hotel: hotel, price: 100 + i * 10)
  end
end
