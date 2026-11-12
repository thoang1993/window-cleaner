require_relative 'date_helper'

class BookingSystem

  PRICE_PER_PROPERTY = 5
  PRICE_PER_WINDOW = 1

  def initialize(customers:, bookings:)
    @customers = customers.to_h { |customer| [customer.customer_number, customer] }
    @bookings = bookings.to_h { |booking| [booking.booking_number, booking] }
  end

  def windows_cleaned_on(date)
    parsed_date = DateHelper.parse(date)
    @bookings.values
      .select { |booking| booking.date == parsed_date } 
      .map { |booking| @customers.fetch(booking.customer_number) }
      .sum(&:windows)
  end

  def booking_cost(booking_number)
    booking = @bookings.fetch(booking_number) {
      raise ArgumentError, "Booking number: #{booking_number} not found"
    }
    customer = @customers.fetch(booking.customer_number) {
      raise ArgumentError, "Customer number: #{booking.customer_number} not found"
    }

    total = (customer.windows * PRICE_PER_WINDOW) + PRICE_PER_PROPERTY 
    total
  end
end
