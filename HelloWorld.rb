class HelloWorld
  def firstMethod
    puts 'hello'
    puts 'World'
    your_name = 'Puneet'
    puts "Hello #{your_name}"
    puts 'ruby test'
  end

  def secondMethod
    ary = ['fred', 10, 3.14, 'This is a   tesst string', 'last element']

    ary.each do |i|
      puts i
    end

    colors = {'red' => 0xf00, 'green' => 0x0f0, 'blue' => 0x00f}
    colors.each do |key, value|
      print key, ' is ', value, "\n"
    end

    (10..15).each do |n|
      print n, ' '
    end
  end

  def initialize
    puts ' I\'m Initialized'
  end
end

obj = HelloWorld.new

obj.firstMethod
obj.secondMethod
