class FetchVsFetchWithBlock

  HASH = { writing: :fast_ruby }

  def fast
    HASH.fetch(:writing) { "fast ruby" }
  end

  def slow
    HASH.fetch(:writing, "fast ruby")
  end

  def run
    Benchmark.ips do |x|
      x.report("Hash#fetch + block") { fast }
      x.report("Hash#fetch + arg")   { slow }
      x.compare!
    end
  end
end
