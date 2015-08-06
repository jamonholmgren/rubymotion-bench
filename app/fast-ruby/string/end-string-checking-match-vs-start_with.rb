class EndStringCheckingMatchVsStartWith

  SLUG = 'root_url'

  def slow
    SLUG =~ /_(path|url)$/
  end

  def fast
    SLUG.end_with?('_path', '_url')
  end

  def run
    Benchmark.ips do |x|
      x.report('String#=~')        { slow }
      x.report('String#end_with?') { fast }
      x.compare!
    end
  end
end
