class CoverVsInclude
  def fast
    (100_000..500_000).cover? 290_000
  end

  def slow
    (100_000..500_000).include? 290_000
  end

  def run
    Benchmark.ips do |x|
      x.report("Range#cover?") { fast }
      x.report("Range#include?") { slow }
      x.compare!
    end
  end
end
