class GsubVsTr

  SLUG = 'writing-fast-ruby'

  def slow
    SLUG.gsub('-', ' ')
  end

  def fast
    SLUG.tr('-', ' ')
  end

  def run
    Benchmark.ips do |x|
      x.report('String#gsub') { slow }
      x.report('String#tr')   { fast }
      x.compare!
    end
  end
end
