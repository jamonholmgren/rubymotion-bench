class MergeBangVsSquareEqual

  ENUM = (1..100)

  def slow
    ENUM.each_with_object({}) do |e, h|
      h.merge!(e => e)
    end
  end

  def fast
    ENUM.each_with_object({}) do |e, h|
      h[e] = e
    end
  end

  def run
    Benchmark.ips do |x|
      x.report('Hash#merge!') { slow }
      x.report('Hash#[]=') { fast }
      x.compare!
    end
  end
end
