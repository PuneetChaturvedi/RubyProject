class Customer
  # attr_reader :name, :id  # creates the getter methods
  # attr_writer :name, :id   # creates the setter methods
  attr_accessor :cust_name, :cust_id, :cust_addr # create both getter and setter methods

  @@no_of_customers = 0

  def initialize(cust_id, cust_name, cust_addr)
    @cust_id = cust_id
    @cust_name = cust_name
    @cust_addr = cust_addr
  end

  #def initialize(name, lastName = nil)
  #   name = name + " " + lastName unless lastName.nil?
  #   @name = name
  #  end

  #def initialize(args)
  #   name = args["name"] + " " + args["lastName"] unless args["lastName"].nil?
  #  @name = name
  #  end

  def display_details()
    puts "Customer id #@cust_id"  # puts "Customer id #cust_id"
    puts "Customer name #@cust_name" #  puts "Customer name #cust_name"
    puts "Customer address #@cust_addr"  #  puts "Customer address @cust_addr"
  end

  def total_no_of_customers()
    @@no_of_customers += 1
    puts "Total number of custoomers: #{@@no_of_customers}"
  end

  def self.createdefaultInstance(cust_id, cust_name, cust_addr)
    new(5, cust_name + 'default', 'Default Address')
  end
end

# Create Objects
cust1 = Customer.new('1', 'John', 'Wisdom Apartments, Ludhiya')
#cust = Customer.new # Gives error, for create object with method , passed the number of params in initialize method

# Call Methods
#cust1.display_details()
#cust1.total_no_of_customers()
#cust2.display_details()

#cust2.total_no_of_customers()

puts cust1.cust_name
cust2 = Customer.createdefaultInstance('', '', '')
puts cust2.cust_name
