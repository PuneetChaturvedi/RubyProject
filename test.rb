require 'mail'
require 'json'
require 'parallel'
require 'benchmark'

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
  end

  def handle5
    returnArr.each_slice(2).each do |x|
      g = x.map do |y|
        y = y + 1
      end
      p g
    end
    p x
    # j = g.map { |y| y * 2 }

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
    s = {'1': '2', '3': 4, 'D': 'puneet', '6': 8}
    y = s.values.map.with_index do |x, i|
      if i == 1 or i == 3
        x = x / 2
      else
        x
      end
    end
    p y

    puts Date.parse('2018-06-08T12:20:14.354Z').to_s
  end

  def handle10
    b = File.birthtime('/Users/chatupu/Documents/editing dot files .rtf')
    puts b
    puts Time.new.to_i
    a = Time.new
    puts ((a - b) / (3600 * 24)).to_i
  end

  def handle11
    unless a.nil? || a == 2
      puts a
    end
  end

  def handle12
    s = '06/13/2018 13:21:55'
    puts DateTime.strptime(s, '%m/%d/%Y %H:%M:%S')
    puts Time.now.getlocal
  end

  def handle13
    # puts @arr
    h = Hash.new { |key, value| }
    a = h['d']
    puts a.nil?
    s = '06/13/2018 13:21:55'
    puts s.split(' ')
  end

  def handle14(_data)
    _data.push(10)
  end

  def handle15
    a = [1, 2]
    a += [3]

    s = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    r = s.each_slice(4).map { |t|
      check(t)
    }.flatten
    p r
  end

  def check(t)
    y = t.map do |a|
      a + 5
    end
    y
  end

  def handle17
    a = [1, 2, 3]
    s = 0
    puts handle16(a, s)
    a = [1, 2, 3]
    puts handle18(a, a.count - 1)
  end

  # Top down recurrsive
  def handle16(arr, s)
    puts arr.kind_of?(Array)
    if arr.count != 0
      s = s + arr.pop()
      handle16(arr, s)
    else
      return s
    end
  end

  # Bottom up recurrsive
  def handle18(a, s)
    if s == 0
      return a[s]
    else
      return a[s] + handle18(a, s - 1)
    end
  end

  def handle19
    handle20(2)
    handle20(5, nil, true)
    handle20(6, 10, false)
  end

  def handle20(req, sample = nil, is_g = false)
    puts req, sample, is_g
    puts '----'
  end

  def handle21
    hm = {:of_or_sl => 'SL', :on_hand_or_from_vendor => 'OH', :sample_type => 'Product', :turn_in_date => nil, :must_be_returned => false, :return_to => 'merchant', :return_notes => '', :silhouette_required => false, :instructions => nil, :sent_to_rrd => false, :completed_at => 'Sun, 07 Oct 2018', :parent_id => 31}

    puts hm[:parent_id]
  end

  def handle22
    a = (1..100)
    sum = 0
    Parallel.map(a, in_threads: 1) do |t|
      sum += t
      sleep 1
    end
  end

  def handle_22
    a = (1..100)
    sum = 0
    a.each do |t|
      sum += t
      sleep 1
    end
  end

  def handle23
    Benchmark.bm(10) do |x|
      x.report('parallel:') { handle22 }
      x.report('without ||:') { handle_22 }
    end
  end
end

#/Users/chatupu/Documents/GitHub/belkApp/photorequest
puts Test.new.handle23

#puts Test.exclaim('hello', number: 4) #=> 'hello!!!!'
# equivalent:
#puts Test.exclaim('hello', {:number => 4}) #=> 'hello!!!!'
# equivalent:
#uts Test.exclaim('hello', :number => 4)#=> 'hello!!!!'
