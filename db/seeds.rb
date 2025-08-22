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
  phone: "5555551234",
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

patients = [
  { first_name: "Sophia",      last_name: "Clark",     phone: 8092310221, updated_at: "2024-11-05" },
  { first_name: "Liam",        last_name: "Johnson",   phone: 8092310222, updated_at: "2024-11-06" },
  { first_name: "Olivia",      last_name: "Smith",     phone: 8092310223, updated_at: "2024-11-07" },
  { first_name: "Noah",        last_name: "Williams",  phone: 8092310224, updated_at: "2024-11-08" },
  { first_name: "Emma",        last_name: "Brown",     phone: 8092310225, updated_at: "2024-11-09" },
  { first_name: "James",       last_name: "Davis",     phone: 8092310226, updated_at: "2024-11-10" },
  { first_name: "Isabella",    last_name: "Miller",    phone: 8092310227, updated_at: "2024-11-11" },
  { first_name: "Mason",       last_name: "Wilson",    phone: 8092310228, updated_at: "2024-11-12" },
  { first_name: "Ava",         last_name: "Martinez",  phone: 8092310229, updated_at: "2024-11-13" },
  { first_name: "Ethan",       last_name: "Anderson",  phone: 8092310230, updated_at: "2024-11-14" },
  { first_name: "Mia",         last_name: "Taylor",    phone: 8092310231, updated_at: "2024-11-15" },
  { first_name: "Benjamin",    last_name: "Thomas",    phone: 8092310232, updated_at: "2024-11-16" },
  { first_name: "Charlotte",   last_name: "Lee",       phone: 8092310233, updated_at: "2024-11-17" },
  { first_name: "Lucas",       last_name: "Harris",    phone: 8092310234, updated_at: "2024-11-18" },
  { first_name: "Amelia",      last_name: "Clark",     phone: 8092310235, updated_at: "2024-11-19" },
  { first_name: "Alexander",   last_name: "Young",     phone: 8092310236, updated_at: "2024-11-20" },
  { first_name: "Harper",      last_name: "King",      phone: 8092310237, updated_at: "2024-11-21" },
  { first_name: "Michael",     last_name: "Scott",     phone: 8092310238, updated_at: "2024-11-22" },
  { first_name: "Evelyn",      last_name: "Hall",      phone: 8092310239, updated_at: "2024-11-23" },
  { first_name: "Elijah",      last_name: "Allen",     phone: 8092310240, updated_at: "2024-11-24" },
  { first_name: "Abigail",     last_name: "Wright",    phone: 8092310241, updated_at: "2024-11-25" },
  { first_name: "Daniel",      last_name: "Lopez",     phone: 8092310242, updated_at: "2024-11-26" },
  { first_name: "Sofia",       last_name: "Hill",      phone: 8092310243, updated_at: "2024-11-27" },
  { first_name: "Matthew",     last_name: "Green",     phone: 8092310244, updated_at: "2024-11-28" },
  { first_name: "Ella",        last_name: "Adams",     phone: 8092310245, updated_at: "2024-11-29" },
  { first_name: "Henry",       last_name: "Baker",     phone: 8092310246, updated_at: "2024-11-30" },
  { first_name: "Scarlett",    last_name: "Gonzalez",  phone: 8092310247, updated_at: "2024-12-01" },
  { first_name: "David",       last_name: "Perez",     phone: 8092310248, updated_at: "2024-12-02" },
  { first_name: "Victoria",    last_name: "Carter",    phone: 8092310249, updated_at: "2024-12-03" }
]

patients.each do |patient|
  patient = Patient.create!(
    first_name: patient[:first_name],
    last_name: patient[:last_name],
    phone: patient[:phone],
    email: "#{patient[:first_name].downcase}@example.com",
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
end

Ability.create!(
  user: dentist,
  subject: "patient",
  action: "manage"
)

puts "✅ Seeding complete!"
