class Person
  def initialize(id, name)
    @name = name
    @id = id
    puts
  end

  def display
    puts "my id is #@id and name is #{@name}"
    puts "my idd is #@id and fiirst name is #@name"
  end
end

obj = Person.new(1, 'puneet')

obj.display()
obj.display
