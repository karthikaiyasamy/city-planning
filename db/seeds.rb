# Create Default Users
puts "Seeding users..."
admin = User.find_or_initialize_by(email: "admin@example.com")
admin.name = "City Admin"
admin.password = "password123"
admin.password_confirmation = "password123"
admin.admin = true
admin.save!

resident = User.find_or_initialize_by(email: "user@example.com")
resident.name = "Jane Resident"
resident.password = "password123"
resident.password_confirmation = "password123"
resident.admin = false
resident.save!

# Create sample permit requests
puts "Seeding permit requests..."
PermitRequest.find_or_create_by!(
  dog_name: "Max",
  breed: "Golden Retriever",
  age: 3,
  owner_name: "Jane Resident",
  owner_phone: "555-0123",
  status: "approved",
  tag_number: "TAG-#{Time.current.year}-88ABC",
  user: resident
)

PermitRequest.find_or_create_by!(
  dog_name: "Bella",
  breed: "French Bulldog",
  age: 1,
  owner_name: "Jane Resident",
  owner_phone: "555-0123",
  status: "pending",
  user: resident
)

puts "Seeding complete!"
puts "----------------"
puts "Admin User: admin@example.com / password123"
puts "Resident User: user@example.com / password123"
