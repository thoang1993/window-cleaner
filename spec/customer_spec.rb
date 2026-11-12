require_relative '../customer'

RSpec.describe Customer do
  it "stores the customer number, name and windows" do
    customer = Customer.new(customer_number: 1, name: "Tony", windows: 11)
    expect(customer.customer_number).to eq(1)
    expect(customer.name).to eq("Tony")
    expect(customer.windows).to eq(11)
  end

  describe "customer number" do
    it "accepts 1" do
      customer = Customer.new(customer_number: 1, name: "Tony", windows: 10)
      expect(customer.customer_number).to eq(1)
    end

    it "rejects 0" do
      expect { Customer.new(customer_number: 0, name: "Tony", windows: 10) }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects -1" do
      expect { Customer.new(customer_number: -1, name: "Tony", windows: 10) }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects an empty string" do
      expect { Customer.new(customer_number: "", name: "Tony", windows: 10) }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects number given as a string" do
      expect { Customer.new(customer_number: "1", name: "Tony", windows: 10) }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end

    it "rejects nil" do
      expect { Customer.new(customer_number: nil, name: "Tony", windows: 10) }.to raise_error(ArgumentError, "customer number must be a positive integer")
    end
  end

  describe "name" do
    it "stored without any surrounding whitespace" do
      customer = Customer.new(customer_number: 1, name: " Tony ", windows: 10)
      expect(customer.name).to eq("Tony")
    end

    it "rejects an empty string" do
      expect { Customer.new(customer_number: 1, name: "", windows: 10) }.to raise_error(ArgumentError, "name must be a non empty string")
    end

    it "rejects an integer" do
      expect { Customer.new(customer_number: 1, name: 123, windows: 10) }.to raise_error(ArgumentError, "name must be a non empty string")
    end

    it "rejects nil" do
      expect { Customer.new(customer_number: 1, name: nil, windows: 10) }.to raise_error(ArgumentError, "name must be a non empty string")
    end

    it "rejects whitespace" do
      expect { Customer.new(customer_number: 1, name: "     ", windows: 10) }.to raise_error(ArgumentError, "name must be a non empty string")
    end
  end

  describe "windows" do
    it "accepts 1" do
      customer = Customer.new(customer_number: 1, name: "Tony", windows: 1)
      expect(customer.windows).to eq(1)
    end

    it "rejects 0" do
      expect { Customer.new(customer_number: 1, name: "Tony", windows: 0) }.to raise_error(ArgumentError, "windows must be a positive integer")
    end

    it "rejects -1" do
      expect { Customer.new(customer_number: 1, name: "Tony", windows: -1) }.to raise_error(ArgumentError, "windows must be a positive integer")
    end

    it "rejects an empty string" do
      expect { Customer.new(customer_number: 1, name: "Tony", windows: "") }.to raise_error(ArgumentError, "windows must be a positive integer")
    end

    it "rejects number given as a string" do
      expect { Customer.new(customer_number: 1, name: "Tony", windows: "10") }.to raise_error(ArgumentError, "windows must be a positive integer")
    end

    it "rejects nil" do
      expect { Customer.new(customer_number: 1, name: "Tony", windows: nil) }.to raise_error(ArgumentError, "windows must be a positive integer")
    end
  end
end
