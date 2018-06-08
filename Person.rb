class Person
  def initialize(id, name)
    @name = name
    @id = id
    puts
  end

  def display
    puts "my id is #@id and first name is #{@name}"
    puts "my id is #@id and first name is #@name"
  end
end

obj = Person.new(1, 'puneet')

obj.display()
obj.display
