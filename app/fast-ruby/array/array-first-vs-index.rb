# require 'benchmark/ips'

class ArrayFirstVsIndex
  ARRAY = [*1..100]

  def fast
    ARRAY[0]
  end

  def slow
    ARRAY.first
  end

  def run
    Benchmark.ips do |x|
      x.report('Array#[0]') { fast }
      x.report('Array#first') { slow }
      x.compare!
    end
  end
end
