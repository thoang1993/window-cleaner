Customer = Data.define(:customer_number, :name, :windows) do
  def initialize(customer_number:, name:, windows:)
    unless customer_number.is_a?(Integer) && customer_number > 0
      raise ArgumentError, "customer number must be a positive integer"
    end

    unless name.is_a?(String)
      raise ArgumentError, "name must be a non empty string"
    end

    trimmed_name = name.strip

    raise ArgumentError, "name must be a non empty string" if trimmed_name.empty?

    unless windows.is_a?(Integer) && windows > 0
      raise ArgumentError, "windows must be a positive integer"
    end

    super(customer_number: customer_number, name: trimmed_name, windows: windows)
  end
end
