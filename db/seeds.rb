require "faker"

# Clean the database
Ability.destroy_all
Appointment.destroy_all
Patient.destroy_all
User.destroy_all
Company.destroy_all


puts "🌱 Seeding db..."

company = Company.create!(
  name: "Bright Smile Clinic",
  address: "123 Dental Ave",
  phone: "+1 555-555-1234",
  email: "contact@brightsmile.com",
  timezone: "America/New_York"
)


dentist = User.create!(
  first_name: "Alice",
  last_name: "Johnson",
  email: "alice@brightsmile.com",
  password: "password",
  company: company
)

patient = Patient.create!(
  first_name: "Charlie",
  last_name: "Brown",
  phone: "+1 555-555-6789",
  email: "charlie@example.com",
  company: company
)

appointment = Appointment.create!(
  scheduled_at: Time.now + 2.days,
  status: :scheduled,
  notes: "Initial consultation and cleaning.",
  company: company,
  patient: patient,
  dentist: dentist
)

Ability.create!(
  user: dentist,
  subject: "patient",
  action: "manage"
)

puts "✅ Seeding complete!"
