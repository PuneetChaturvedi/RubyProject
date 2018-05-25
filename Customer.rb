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
       puts "Customer id #@cust_id"
       puts "Customer name #@cust_name"
       puts "Customer address #@cust_addr"
    end
    def total_no_of_customers()
       @@no_of_customers += 1
       puts "Total number of customers: #{@@no_of_customers}"
    end
end
 
 # Create Objects
 cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
 #cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")
 
 # Call Methods
 #cust1.display_details()
 #cust1.total_no_of_customers()
 #cust2.display_details()
 
 #cust2.total_no_of_customers()
 puts cust1.cust_name

 
