require_relative 'customer'
require_relative 'booking'
require_relative 'booking_system'

customers =
  [
    Customer.new(customer_number: 1, name: "John", windows: 10),
    Customer.new(customer_number: 2, name: "Paul", windows: 5),
    Customer.new(customer_number: 3, name: "Ringo", windows: 12),
    Customer.new(customer_number: 4, name: "George", windows: 4)
  ]

bookings =
  [
    Booking.new(booking_number: 1, customer_number: 4, date: "2025-10-01"),
    Booking.new(booking_number: 2, customer_number: 2, date: "2026-01-10"),
    Booking.new(booking_number: 3, customer_number: 1, date: "2025-10-01"),
    Booking.new(booking_number: 4, customer_number: 3, date: "2025-10-01")
  ]

booking_system = BookingSystem.new(customers: customers, bookings: bookings)

puts "Windows cleaned on 2025-10-01: #{booking_system.windows_cleaned_on("2025-10-01")}"

puts "Booking 1 costs £#{booking_system.booking_cost(1)}"
puts "Booking 2 costs £#{booking_system.booking_cost(2)}"
puts "Booking 3 costs £#{booking_system.booking_cost(3)}"
puts "Booking 4 costs £#{booking_system.booking_cost(4)}"

begin
  booking_system.booking_cost(999)
rescue ArgumentError => e
  puts "Error: #{e.message}"
end

