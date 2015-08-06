class CountVsSize

  ARRAY = [*1..100]

  def slow
    ARRAY.count
  end

  def fast
    ARRAY.size
  end

  def run
    Benchmark.ips do |x|
      x.report('#count') { slow }
      x.report('#size')  { fast }
      x.compare!
    end
  end
end
