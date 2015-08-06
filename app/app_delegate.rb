class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # BenchRespondOrException.new.perform
    FastRuby.run

    true
  end
end



