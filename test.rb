class Test
  def path
    sum = 10
    a = (1..100).to_a
    a.each { |x| sum = sum + x }
    sum
  end

  def testm
    z = path
    puts z
  end

  def handle
    sum = 0
    a = (1..100).to_a
    a.each do |x|
      begin
        if x == 5
          raise RuntimeError.new('You messed up!')
        end
      rescue RuntimeError => e
        puts e.message
        next
      end
      sum = sum + x
    end
    sum
  end

  def handle2
    sum = 0
    a = (1..100).to_a
    a.each do |x|
      begin
        if x == 5
          2 / 0
        end
      rescue Exception => e
        puts e.message
        next
      end
      sum = sum + x
    end

    sum
  end

  def handle3
    n = 1
    loop do
      n = n + 5
      puts n
      next unless n == 10
      puts 'Good'
      break
    end

    puts File.join(Dir.pwd, 'tmp/ftp/')
  end

  def handle4
    enumerator = %w(one two three).each
    puts enumerator.class # => Enumerator

    enumerator.each_with_object('foo') do |item, obj|
      puts "#{obj}: #{item}"
    end

    enumerator.each_with_index do |item, index|
      puts "#{index}: #{item}"
    end

    puts %w[foo bar baz].map.with_index { |w, i| "#{i}:#{w}" }

    puts File.basename('/Users/chatupu/Downloads/PREQ/photoRequests_2018-05-30_16-59-42.xml.zip')
  end

  def returnArr
    require 'logger'
    @@dir = File.join(Dir.pwd, 'log/belkAppp.log')
    @@logs = Logger.new(STDOUT, 'daily', 7)    #STDOUT
    @@logs.level = Logger::DEBUG

    a = [1, 2, 34, 6, 7, 8]
    a.push(5)
    @@logs.debug('hi')
  end

  def handle5
    returnArr.each_slice(2) do |g|
      j = g.map { |y| y * 2 }

      p j
    end
  end
end

#/Users/chatupu/Documents/GitHub/belkApp/photorequest
puts Test.new.handle5
