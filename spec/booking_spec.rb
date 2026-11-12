require 'date'
require_relative '../booking'
require_relative '../date_helper'

RSpec.describe Booking do
  it "stores the booking number, customer number and date" do
    booking = Booking.new(booking_number: 1, customer_number: 1, date: "2026-11-11")
    expect(booking.booking_number).to eq(1)
    expect(booking.customer_number).to eq(1)
    expect(booking.date).to eq(DateHelper.parse("2026-11-11"))
  end
  describe "booking number" do
    it "accepts 1" do
      booking = Booking.new(booking_number: 1, customer_number: 1, date: "2026-11-11")
      expect(booking.booking_number).to eq(1)
    end

    it "rejects 0" do
      expect { Booking.new(booking_number: 0, customer_number: 1, date: "2026-11-11") }.to raise_error(ArgumentError, "booking number must be a positive integer")
    end

    it "rejects -1" do
      expect { Booking.new(booking_number: -1, customer_number: 1, date: "2026-11-11") }.to raise_error(ArgumentError, "booking number must be a positive integer")
    end

    it "rejects an empty string" do
      expect { Booking.new(booking_number: "", customer_number: 1, date: "2026-11-11") }.to raise_error(ArgumentError, "booking number must be a positive integer")
    end

    it "rejects number given as a string" do
      expect { Booking.new(booking_number: "0", customer_number: 1, date: "2026-11-11") }.to raise_error(ArgumentError, "booking number must be a positive integer")
    end

    it "rejects nil" do
      expect { Booking.new(booking_number: nil, customer_number: 1, date: "2026-11-11") }.to raise_error(ArgumentError, "booking number must be a positive integer")
    end
  end

  describe "customer number" do
    it "accepts 1" do
      booking = Booking.new(booking_number: 1, customer_number: 1, date: "2026-11-11")
      expect(booking.customer_number).to eq(1)
    end

    it "rejects 0" do
      expect { Booking.new(booking_number: 1, customer_number: 0, date: "2026-11-11") }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects -1" do
      expect { Booking.new(booking_number: 1, customer_number: -1, date: "2026-11-11") }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects an empty string" do
      expect { Booking.new(booking_number: 1, customer_number: "", date: "2026-11-11") }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects number given as a string" do
      expect { Booking.new(booking_number: 1, customer_number: "0", date: "2026-11-11") }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects nil" do
      expect { Booking.new(booking_number: 1, customer_number: nil, date: "2026-11-11") }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end
  end

  describe "date" do
    it "accepts a valid date" do
      booking = Booking.new(booking_number: 1, customer_number: 1, date: "2026-11-11")
      expect(booking.date).to eq(DateHelper.parse("2026-11-11"))
    end

    it "rejects an impossible date" do
      expect { Booking.new(booking_number: 1, customer_number: 1, date: "2026-30-30") }.to raise_error(ArgumentError, 'Invalid Date: "2026-30-30", Expected format: YYYY-MM-DD')
    end

    it "rejects a date in the wrong format" do
      expect { Booking.new(booking_number: 1, customer_number: 1, date: "20263030") }.to raise_error(ArgumentError, 'Invalid Date: "20263030", Expected format: YYYY-MM-DD')
    end

    it "rejects a string that is not a date" do
      expect { Booking.new(booking_number: 1, customer_number: 1, date: "testing") }.to raise_error(ArgumentError, 'Invalid Date: "testing", Expected format: YYYY-MM-DD')
    end

    it "rejects an empty string" do
      expect { Booking.new(booking_number: 1, customer_number: 1, date: "") }.to raise_error(ArgumentError, 'Invalid Date: "", Expected format: YYYY-MM-DD')
    end

    it "rejects nil" do
      expect { Booking.new(booking_number: 1, customer_number: 1, date: nil) }.to raise_error(ArgumentError, 'Invalid Date: nil, Expected format: YYYY-MM-DD')
    end
  end
end