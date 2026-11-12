require_relative 'date_helper'

Booking = Data.define(:booking_number, :customer_number, :date) do
  def initialize(booking_number:, customer_number:, date:)
    unless booking_number.is_a?(Integer) && booking_number > 0
      raise ArgumentError, "booking number must be a positive integer"
    end

    unless customer_number.is_a?(Integer) && customer_number > 0
      raise ArgumentError, "customer number must be a positive integer"
    end

    parsed_date = DateHelper.parse(date)

    super(booking_number: booking_number, customer_number: customer_number, date: parsed_date)
  end
end
