# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

users = User.create!([
    {
        name: "Tom",
        email: "tom@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        admin: true,
    },
    {
        name: "Frank",
        email: "frank@gmail.com",
        password: "123456",
        password_confirmation: "123456",
    }
])

categories = Category.create!([{ name: 'The Unrated', description: 'Hotels under this category have not been rated yet' }, { name: 'Bronze Ultra', description: 'The lowest rated category', rating: 1 }, { name: 'Silver Ultra', description: 'The second lowest rated category', rating: 2 }, { name: 'Gold Ultra', description: 'The third highest rated category', rating: 3 }, { name: 'Diamond Ultra', description: 'The second highest category', rating: 4 }, { name: 'Platinum Ultra', description: 'The highest rated category', rating: 5 }])

hotels = Hotel.create!([
  {
      name: "Villa Rosa Kempinski",
      price: 300.0,
      description: "Step beyond your door and get a fresh take on your local area. Whether you are keen to catch-up with friends and family or treat yourself to a well-deserved moment of relaxation, we are waiting to warmly welcome you with our renowned luxury five-star service. This special offer is exclusively reserved for our local community - the heart and soul of charming Kenya.",
      country: "Kenya",
      category_id: 6,
      city: "Nairobi",
      address: "Chiromo Rd, Nairobi",
      image_url: "https://media.kempinski.com/34401806/4-5.jpg;width=1905;height=794;mode=crop;anchor=middlecenter;autorotate=true;quality=85;scale=both;progressive=true;encoder=freeimage;format=jpg",
  },
  {
      name: "Hotel Calimala",
      price: 300.0,
      description: "Featuring a restaurant, fitness centre, bar and free WiFi, Hotel Calimala is located in Florence, less than 1 km from Cathedral of Santa Maria del Fiore and a 10-minute walk from Piazza del Duomo di Firenze. This 4-star hotel offers a concierge service and a tour desk. The property provides city views, a terrace and a 24-hour front desk.",
      country: "Italy",
      category_id: 6,
      city: "Florence",
      address: " Via Calimala, Uffizi, 50123 Florence, Italy",
      image_url: "https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/223896217.jpg?k=4c5cbb0cfde66005c74ac21195c2776891cd1bad58cf28ec0068dae2c1ea0b9c&o=&hp=1",      
  },

  {
      name: 'Rayavadee',
      price: 300.0,
      description: "At Rayavadee, you can look forward to a round-trip airport shuttle, a poolside bar and a terrace. This hotel is a great place to bask in the sun with a beachfront location, beachfront dining and beach towels. Treat yourself to a manicure/pedicure, a facial or a body wrap at The Rayavadee Spa, the on-site spa",
      country: "Thailand",
      city: "Tumbon Ao-Nang",
      category_id: 6,
      address: "214 Moo 2, Tumbon Ao-Nang",
      image_url: "https://images.trvl-media.com/hotels/1000000/880000/874200/874163/37e24c33.jpg?impolicy=resizecrop&rw=1200&ra=fit",

  },

  {
      name: "Algarve Hotel ",
      price: 300.0,
      description: "Featuring stunning views over the Falésia beach and a plethora of luxurious amenities and facilities, EPIC SANA Algarve Hotel is certain to make every guest's stay as enjoyable and memorable as possible. Among its luxurious facilities are 162 well-appointed rooms, 24 garden suites, 43 resort suites, as well as a spa and fitness centre, five outdoor pools, three restaurants, spacious conference rooms and many more. Whether you are travelling for leisure or business, this hotel will surely meet and exceed your expectations.",
      country: "Portugal",
      category_id: 6,
      city: "Lisbon",
      address: "214 Moo 2, Lisbon",
      image_url: "https://photos.travelmyth.com/hotels/480/27/s-276168.jpg?quality=85&?crop=480,480?crop_gravity=center&width=480",
  },
  {
    name: "Villa Rosa Diamond",
    price: 250.0,
    description: "Step beyond your door and get a fresh take on your local area. Whether you are keen to catch-up with friends and family or treat yourself to a well-deserved moment of relaxation, we are waiting to warmly welcome you with our renowned luxury five-star service. This special offer is exclusively reserved for our local community - the heart and soul of charming Kenya.",
    country: "Kenya",
    category_id: 5,
    city: "Nairobi",
    address: "Chiromo Rd, Nairobi",
    image_url: "https://media.kempinski.com/34401806/4-5.jpg;width=1905;height=794;mode=crop;anchor=middlecenter;autorotate=true;quality=85;scale=both;progressive=true;encoder=freeimage;format=jpg",
},
{
    name: "Hotel Calimala Gold",
    price: 200.0,
    description: "Featuring a restaurant, fitness centre, bar and free WiFi, Hotel Calimala is located in Florence, less than 1 km from Cathedral of Santa Maria del Fiore and a 10-minute walk from Piazza del Duomo di Firenze. This 4-star hotel offers a concierge service and a tour desk. The property provides city views, a terrace and a 24-hour front desk.",
    country: "Italy",
    category_id: 4,
    city: "Florence",
    address: " Via Calimala, Uffizi, 50123 Florence, Italy",
    image_url: "https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/223896217.jpg?k=4c5cbb0cfde66005c74ac21195c2776891cd1bad58cf28ec0068dae2c1ea0b9c&o=&hp=1",      
},

{
    name: 'Rayavadee Silver',
    price: 300.0,
    description: "At Rayavadee, you can look forward to a round-trip airport shuttle, a poolside bar and a terrace. This hotel is a great place to bask in the sun with a beachfront location, beachfront dining and beach towels. Treat yourself to a manicure/pedicure, a facial or a body wrap at The Rayavadee Spa, the on-site spa",
    country: "Thailand",
    city: "Tumbon Ao-Nang",
    category_id: 3,
    address: "214 Moo 2, Tumbon Ao-Nang",
    image_url: "https://images.trvl-media.com/hotels/1000000/880000/874200/874163/37e24c33.jpg?impolicy=resizecrop&rw=1200&ra=fit",

},

{
    name: "Algarve Hotel Gold",
    price: 200.0,
    description: "Featuring stunning views over the Falésia beach and a plethora of luxurious amenities and facilities, EPIC SANA Algarve Hotel is certain to make every guest's stay as enjoyable and memorable as possible. Among its luxurious facilities are 162 well-appointed rooms, 24 garden suites, 43 resort suites, as well as a spa and fitness centre, five outdoor pools, three restaurants, spacious conference rooms and many more. Whether you are travelling for leisure or business, this hotel will surely meet and exceed your expectations.",
    country: "Portugal",
    category_id: 4,
    city: "Lisbon",
    address: "214 Moo 2, Lisbon",
    image_url: "https://photos.travelmyth.com/hotels/480/27/s-276168.jpg?quality=85&?crop=480,480?crop_gravity=center&width=480",
}
]
)
