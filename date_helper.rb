require 'date'

module DateHelper
  def self.parse(date)
    unless date.is_a?(String) && date.match?(/\A\d{4}-\d{2}-\d{2}\z/)
      raise ArgumentError, "Invalid Date: #{date.inspect}, Expected format: YYYY-MM-DD"
    end

    begin
      Date.iso8601(date)
    rescue Date::Error
      raise ArgumentError, "Invalid Date: #{date.inspect}, Expected format: YYYY-MM-DD"
    end
  end
end