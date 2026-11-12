require_relative '../customer'
require_relative '../booking'
require_relative '../booking_system'

RSpec.describe BookingSystem do
  let(:customers) do
    [
      Customer.new(customer_number: 1, name: "John", windows: 10),
      Customer.new(customer_number: 2, name: "Paul", windows: 5),
      Customer.new(customer_number: 3, name: "Ringo", windows: 12),
      Customer.new(customer_number: 4, name: "George", windows: 4)
    ]
  end

  let(:bookings) do
    [
      Booking.new(booking_number: 1, customer_number: 4, date: "2025-10-01"),
      Booking.new(booking_number: 2, customer_number: 2, date: "2026-01-10"),
      Booking.new(booking_number: 3, customer_number: 1, date: "2025-10-01"),
      Booking.new(booking_number: 4, customer_number: 3, date: "2025-10-01")
    ]
  end

  let(:booking_system) { described_class.new(customers: customers, bookings: bookings) }

  describe "windows cleaned on" do
    it "returns total windows cleaned on given date" do
      expect(booking_system.windows_cleaned_on("2025-10-01")).to eq(26)
    end

    it "returns 0 for a valid date without bookings" do
      expect(booking_system.windows_cleaned_on("2025-12-25")).to eq(0)
    end

    it "rejects an invalid date" do
      expect { booking_system.windows_cleaned_on("2025-02-30") }.to raise_error(ArgumentError, 'Invalid Date: "2025-02-30", Expected format: YYYY-MM-DD')
    end
  end

  describe "costs for booking" do
    it "returns 15 for booking number 3" do
      expect(booking_system.booking_cost(3)).to eq(15)
    end
    
    it "rejects a booking number that does not exist" do
      expect { booking_system.booking_cost(999) }.to raise_error(ArgumentError, "Booking number: 999 not found")
    end
  end
end