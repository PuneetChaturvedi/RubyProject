require 'Parallel'
require 'benchmark'

class ThreadTest
  def test
    puts Benchmark.measure {
      summ = 0
      100000.times do
        a = (1..10).to_a
        a.each { |s| summ = summ + s }
      end
    }
    puts Benchmark.measure {
      sum = 0
      100000.times do
        Parallel.each(1..11, :in_threads => 4) do |user|
          user = sum + user
        end
      end
    }
  end

  def test2
    puts File.join(File.dirname(__FILE__), '/downloads/Preq', '/')
  end
end

ThreadTest.new.test2
