class BlockYield
  def testblock(&message)
    puts 'Hey'
    yield if block_given?
    # or
    message.call()
  end

  def welcome(*person, &message)
    person.each do |p|
      puts "Hi #{p}...how are you today ?"
      message.call() if block_given? # this will execute the block passed to it without this exception
                                     #   will be thrown if there is no block passed.
    end
  end

  def welcome2(*person)
    person.each do |p|
      puts "Hi #{p}...how are you ?"
      yield if block_given? # yield will be called only if block is passed to it without this exception
                            #   will be thrown if there is no block passed.
    end
  end
end

class BlockYield2
  def welcome(*person, &message)
    person.each do |p|
      puts "Hi #{p}...how are you today ?"
      message.call(p) if block_given? # this will execute if the block passed.
    end
  end

  def welcome2(*person)
    person.each do |p|
      puts "Hi #{p}...how are you ?"
      yield(p) if block_given? # yield will be called only if block is passed.
    end
  end
end

class BlockYield3
  def welcome(*person, &message)
    no_of_argument = message.arity
    case no_of_argument
    when 1
      puts 'only one parameter is passed'
      person.each do |p|
        print_message(p, &message)
      end
    when 2
      puts 'wao..all  required parameter are passed'
      person.each do |p|
        print_message(&message)
      end
    else
      raise 'invalid no of parameter'
    end
  end

  def print_message(p)
    puts 'welcome message will be printed by this method'
    puts yield(p) if block_given?
  end
end

BlockYield.new.testblock { puts 'dude!' }
BlockYield.new.welcome('puneet', 'prabhat') do
  puts 'Welcome message from the bllock'
end
BlockYield.new.welcome2('puneet', 'prabhat') do
  puts 'Welcome message from the block'
  puts '------------'
end

BlockYield2.new.welcome('puneet') { |person| puts "Welcome message from #{person}  to the block" }
BlockYield2.new.welcome2('puneet') { |person| puts "Welcome message from #{person}  to the block" }

BlockYield3.new.welcome('puneet') { |person| puts "Welcome message from #{person}  to the block" }

BlockYield3.new.welcome('xmen') do |person|
  puts "Welcome message from #{person}  to the block"
end
