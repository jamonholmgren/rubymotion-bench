class StartStringCheckingMatchVsStartWith

  SLUG = 'test_reverse_merge.rb'

  def slow
    SLUG =~ /^test_/
  end

  def fast
    SLUG.start_with?('test_')
  end

  def run
    Benchmark.ips do |x|
      x.report('String#=~')          { slow }
      x.report('String#start_with?') { fast }
      x.compare!
    end
  end
end
