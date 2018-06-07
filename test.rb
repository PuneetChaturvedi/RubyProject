require 'mail'
require 'json'

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

    puts File.basename('/Users/chatupu/Downloads/PREQ/photoRequests_2018-05-30_16.xml.zip')
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

  def handle6
    main = Hash.new
    main = {'a' => 'b', 'c' => 'd'}.to_h
    main = main.merge({'e' => 'f'})
    puts main
  end

  def handle7
    update_hashes = [{'id' => 109, 'color_id' => '212'}].map(&:to_hash)
    update_hashes.map do |update_hash|
      puts update_hash
    end
  end

  def self.exclaim(texttext, exclamation: '!', number: 7)
    text + exclamation * number
  end

  def send_mail(from, to, subject, body, add_file: nil)
    #mail = Mail.new
    mail = Mail.new do
      from 'Test@test.com'
      to 'puneet_chaturvedi@belk.com'
      subject 'This is a test email'
      body 'Hello'
      add_file add_file
    end
    #mail[:from] = from
    #mail[:to] = to
    #mail.subject = subject
    #mail.body = body
    #mail[:add_file] = add_file
    mail.delivery_method :smtp, address: 'belksmtp', port: 25
    mail.deliver
  end

  def handle8
    send_mail('puneet_chaturvedi@belk.com', 'puneet_chaturvedi@belk.com', 'test mail', 'test home', add_file: '/Users/chatupu/Downloads/Constants.java')

    #send_emails('sender@domain.com', ['puneet_chaturvedi@belk.com'], 'test Email', 'Hi there this is a test email hope you like it')
  end

  #change to your server

  def send_emails
    x = Mail.new
    x.defaults do
      delivery_method :sendmail
    end
    x do
      to 'puneet_chaturvedi@belk.com'
      from 'ada@test.lindsaar.net'
      subject 'testing sendmail'
      body 'testing sendmail'
    end
    x.deliver
  end

  def handle9
    s = {'1512826' => {'Ecomm Photo Status' => 'Shots Selected', 'Image Specialist Task Status' => 'Open', 'Sample Reject Reason' => 'not good'},
         '1512827' => {'Ecomm Photo Status' => 'Recieved', 'Sample Reject Reason' => 'not good'}}
    a = []
    s.each do |key, value|
      a.push 'id': key, 'Ecomm Photo Status': value['Ecomm Photo Status'], ' sample Reject Reason': value['Sample Reject Reason']
    end

    puts a.to_json
  end

  def handle10
    b = File.birthtime('/Users/chatupu/Documents/editing dot files.rtf')
    puts b
    puts Time.new.to_i
    a = Time.new
    puts ((a - b) / (3600 * 24)).to_i
  end
end

#/Users/chatupu/Documents/GitHub/belkApp/photorequest
puts Test.new.handle10

#puts Test.exclaim('hello', number: 4) #=> 'hello!!!!'
# equivalent:
#puts Test.exclaim('hello', {:number => 4}) #=> 'hello!!!!'
# equivalent:
#uts Test.exclaim('hello', :number => 4)#=> 'hello!!!!'
