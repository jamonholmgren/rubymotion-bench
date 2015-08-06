class BeginRescueVsRespondTo

  def slow
    begin
      writing
    rescue
      'fast ruby'
    end
  end

  def fast
    if respond_to?(:writing)
      writing
    else
      'fast ruby'
    end
  end

  def run
    Benchmark.ips do |x|
      x.report('begin...rescue') { slow }
      x.report('respond_to?')    { fast }
      x.compare!
    end
  end
end
