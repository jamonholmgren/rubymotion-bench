class CasecmpVsDowncase

  SLUG = 'ABCD'

  def slow
    SLUG.downcase == 'abcd'
  end

  def fast
    SLUG.casecmp('abcd') == 0
  end

  def run
    Benchmark.ips do |x|
      x.report('String#downcase + ==') { slow }
      x.report('String#casecmp')       { fast }
      x.compare!
    end
  end
end
