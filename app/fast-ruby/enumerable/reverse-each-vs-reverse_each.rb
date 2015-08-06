class ReverseEachVsReverseEach

  ARRAY = (1..100).to_a

  def slow
    ARRAY.reverse.each{|x| x}
  end

  def fast
    ARRAY.reverse_each{|x| x}
  end

  def run
    Benchmark.ips do |x|
      x.report('Array#reverse.each') { slow }
      x.report('Array#reverse_each') { fast }
      x.compare!
    end
  end
end
