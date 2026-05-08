puts "Seeding Users..."

users = [
  {
    name: "Admin One",
    email: "admin1@example.com",
    phone_number: "9876543210",
    role: "admin",
    password: "Password@123",
    password_confirmation: "Password@123"
  },
  {
    name: "Broker One",
    email: "broker1@example.com",
    phone_number: "9876543211",
    role: "broker",
    password: "Password@123",
    password_confirmation: "Password@123"
  },
  {
    name: "Broker Two",
    email: "broker2@example.com",
    phone_number: "9876543214",
    role: "broker",
    password: "Password@123",
    password_confirmation: "Password@123"
  },
  {
    name: "User One",
    email: "user1@example.com",
    phone_number: "9876543212",
    role: "user",
    password: "Password@123",
    password_confirmation: "Password@123"
  },
  {
    name: "User Two",
    email: "user2@example.com",
    phone_number: "9876543213",
    role: "user",
    password: "Password@123",
    password_confirmation: "Password@123"
  }
]

users.each do |user_attrs|
  user = User.find_or_initialize_by(email: user_attrs[:email])
  user.assign_attributes(user_attrs)
  user.save!
end

puts "✅ Users seeded successfully!"


puts "✅ Seeding Home Page..."

home_page = Home.find_or_initialize_by(hero_title: "Find Your Dream Home")

home_page.assign_attributes(
  hero_subtitle: "Buy, sell, or rent properties with ease and confidence",
  hero_badge_text: "Trusted Real Estate Platform"
)

# Attach hero image (Active Storage)
image_path = Rails.root.join("app/assets/images/home/real_state.jpg")

if File.exist?(image_path)
  home_page.hero_image.attach(
    io: File.open(image_path),
    filename: "real_state.jpg",
    content_type: "image/jpeg"
  )
else
  puts "⚠️ Hero image not found at #{image_path}"
end

home_page.save!

puts "✅ Home Page seeded successfully!"


puts "✅ Seeding Features"
features = [
  { name: "Swimming Pool", icon: "fa-solid fa-person-swimming" },
  { name: "Gym", icon: "fa-solid fa-dumbbell" },
  { name: "Parking", icon: "fa-solid fa-car" },
  { name: "Security", icon: "fa-solid fa-shield-halved" },
  { name: "Elevator", icon: "fa-solid fa-elevator" },
  { name: "Power Backup", icon: "fa-solid fa-bolt" },
  { name: "24x7 Water Supply", icon: "fa-solid fa-faucet" },
  { name: "Garden", icon: "fa-solid fa-tree" },
  { name: "Children Play Area", icon: "fa-solid fa-child" },
  { name: "Club House", icon: "fa-solid fa-people-group" },
  { name: "Fire Safety", icon: "fa-solid fa-fire-extinguisher" },
  { name: "CCTV Surveillance", icon: "fa-solid fa-video" }
]

features.each do |feature|
  Feature.find_or_create_by!(name: feature[:name]) do |f|
    f.icon = feature[:icon]
  end
end

puts "✅ Features seeded succssfully!"


puts "✅ Seeding Property Category"
property_categories = [
  { name: "Residential" },
  { name: "Commercial" },
  { name: "Other" }
]

property_categories.each do |category|
  PropertyCategory.create!(category)
end

puts "✅ Property Category seeded succssfully!"


puts "✅ Seeding Property Types"

# Fetch property categories
residential = PropertyCategory.find_by!(name: "Residential")
commercial  = PropertyCategory.find_by!(name: "Commercial")
other       = PropertyCategory.find_by!(name: "Other")

property_types = [
  # Residential
  { name: "Apartment",  property_category: residential },
  { name: "Villa",      property_category: residential },
  { name: "Penthouse",  property_category: residential },
  { name: "Plot",       property_category: residential },

  # Commercial
  { name: "Office",     property_category: commercial },
  { name: "Showroom",   property_category: commercial },
  { name: "Warehouse",  property_category: commercial },

  # Other
  { name: "Farm House", property_category: other },
  { name: "Farm Land",  property_category: other }
]

property_types.each do |type|
  PropertyType.find_or_create_by!(
    name: type[:name],
    property_category: type[:property_category]
  )
end

puts "✅ Property Types seeded successfully!"



puts "✅ Seeding  About Us"

about = {
  hero_title: "Find Your Perfect Property",
  hero_subtitle: "Trusted real estate solutions for buying, selling, and renting properties with ease.",
  years_experience: 12,
  cities_covered: 18,
  properties_listed: 1250,
  happy_customers: 980,
  mission_title: "Our Mission",
  mission_description: "To simplify real estate decisions by providing transparent, reliable, and customer-focused property services.",
  vision_title: "Our Vision",
  vision_description: "To become the most trusted real estate platform, connecting people with properties that truly feel like home.",
  values_offer: "Verified listings, expert guidance, seamless transactions, and end-to-end customer support.",
  values_why: "We believe in honesty, innovation, and long-term relationships built on trust and results."
}

About.create!(about)

puts "✅ About Us seeded succssfully!"



puts "✅ Seeding Properties with Features"

# Brokers (Owners of properties)
broker1 = User.find_by!(email: "broker1@example.com")
broker2 = User.find_by!(email: "broker2@example.com")

# Property Categories
residential = PropertyCategory.find_by!(name: "Residential")
commercial  = PropertyCategory.find_by!(name: "Commercial")
other       = PropertyCategory.find_by!(name: "Other")

# Property Types
apartment  = PropertyType.find_by!(name: "Apartment",  property_category: residential)
villa      = PropertyType.find_by!(name: "Villa",      property_category: residential)
penthouse  = PropertyType.find_by!(name: "Penthouse",  property_category: residential)
plot       = PropertyType.find_by!(name: "Plot",       property_category: residential)

office     = PropertyType.find_by!(name: "Office",     property_category: commercial)
showroom   = PropertyType.find_by!(name: "Showroom",   property_category: commercial)
warehouse  = PropertyType.find_by!(name: "Warehouse",  property_category: commercial)

farm_house = PropertyType.find_by!(name: "Farm House", property_category: other)
farm_land  = PropertyType.find_by!(name: "Farm Land",  property_category: other)

# Fetch all features
all_features = Feature.all

properties = [
  {
    title: "Luxury Apartment in Mumbai",
    description: "Modern apartment with city view",
    price: 15000000,
    area_sqft: 1200,
    bedrooms: 2,
    bathrooms: 2,
    furnished: true,
    city: "Mumbai",
    state: "Maharashtra",
    location: "Andheri West",
    status: "sale",
    sale_status: "available",
    published: true,
    user: broker1,
    property_category: residential,
    property_type: apartment
  },
  {
    title: "Premium Villa in Pune",
    description: "Spacious villa with private garden",
    price: 32000000,
    area_sqft: 2800,
    bedrooms: 4,
    bathrooms: 4,
    furnished: false,
    city: "Pune",
    state: "Maharashtra",
    location: "Baner",
    status: "sale",
    sale_status: "available",
    published: true,
    user: broker2,
    property_category: residential,
    property_type: villa
  },
  {
    title: "Penthouse with Sea View",
    description: "High-end penthouse near the beach",
    price: 55000000,
    area_sqft: 3500,
    bedrooms: 4,
    bathrooms: 5,
    furnished: true,
    city: "Mumbai",
    state: "Maharashtra",
    location: "Juhu",
    status: "sale",
    sale_status: "available",
    published: true,
    user: broker1,
    property_category: residential,
    property_type: penthouse
  },
  {
    title: "Residential Plot in Nagpur",
    description: "Ideal plot for home construction",
    price: 6500000,
    area_sqft: 2000,
    bedrooms: 0,
    bathrooms: 0,
    furnished: false,
    city: "Nagpur",
    state: "Maharashtra",
    location: "Manish Nagar",
    status: "sale",
    sale_status: "available",
    published: true,
    user: broker1,
    property_category: residential,
    property_type: plot
  },
  {
    title: "Corporate Office Space",
    description: "Fully furnished office space",
    price: 180000,
    area_sqft: 1500,
    bedrooms: 0,
    bathrooms: 2,
    furnished: true,
    city: "Bengaluru",
    state: "Karnataka",
    location: "Whitefield",
    status: "rent",
    sale_status: "available",
    published: true,
    user: broker2,
    property_category: commercial,
    property_type: office
  },
  {
    title: "Prime Showroom Location",
    description: "Showroom on main road",
    price: 250000,
    area_sqft: 1800,
    bedrooms: 0,
    bathrooms: 1,
    furnished: false,
    city: "Delhi",
    state: "Delhi",
    location: "Karol Bagh",
    status: "rent",
    sale_status: "available",
    published: true,
    user: broker2,
    property_category: commercial,
    property_type: showroom
  },
  {
    title: "Large Warehouse Facility",
    description: "Warehouse suitable for logistics",
    price: 400000,
    area_sqft: 6000,
    bedrooms: 0,
    bathrooms: 2,
    furnished: false,
    city: "Ahmedabad",
    state: "Gujarat",
    location: "Sanand",
    status: "rent",
    sale_status: "available",
    published: true,
    user: broker1,
    property_category: commercial,
    property_type: warehouse
  },
  {
    title: "Farm House Near Lonavala",
    description: "Peaceful farmhouse with greenery",
    price: 18000000,
    area_sqft: 5000,
    bedrooms: 3,
    bathrooms: 3,
    furnished: true,
    city: "Lonavala",
    state: "Maharashtra",
    location: "Khandala",
    status: "sale",
    sale_status: "available",
    published: true,
    user: broker1,
    property_category: other,
    property_type: farm_house
  },
  {
    title: "Agricultural Farm Land",
    description: "Fertile land suitable for farming",
    price: 9000000,
    area_sqft: 20_000,
    bedrooms: 0,
    bathrooms: 0,
    furnished: false,
    city: "Nashik",
    state: "Maharashtra",
    location: "Trimbak Road",
    status: "sale",
    sale_status: "available",
    published: true,
    user: broker2,
    property_category: other,
    property_type: farm_land
  },
  {
    title: "2 BHK Apartment for Rent",
    description: "Well-connected residential apartment",
    price: 35000,
    area_sqft: 900,
    bedrooms: 2,
    bathrooms: 2,
    furnished: true,
    city: "Hyderabad",
    state: "Telangana",
    location: "Madhapur",
    status: "rent",
    sale_status: "available",
    published: true,
    user: broker1,
    property_category: residential,
    property_type: apartment
  }
]

properties.each do |attrs|
  property = Property.find_or_create_by!(
    title: attrs[:title],
    user: attrs[:user]
  ) do |p|
    p.assign_attributes(attrs)
  end

  # Assign minimum 5 random features
  property.features = all_features.sample(5)
end

puts "✅ Properties seeded successfully with features!"

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?