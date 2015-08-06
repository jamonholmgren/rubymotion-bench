class ShuffleFirstVsSample

  ARRAY = [*1..100]

  def slow
    ARRAY.shuffle.first
  end

  def fast
    ARRAY.sample
  end

  def run
    Benchmark.ips do |x|
      x.report('Array#shuffle.first') { slow }
      x.report('Array#sample')        { fast }
      x.compare!
    end
  end
end
