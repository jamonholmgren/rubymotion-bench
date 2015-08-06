# class UIView
#   def testa
#   end
# end

# class AppDelegate
#   def application(application, didFinishLaunchingWithOptions:launchOptions)
#     test_view = UIView.new
#     Benchmark.ips do |x|
#       x.report("warm-up") do
#         test_view.testa
#         test_view.respond_to?(:testa)
#         test_view.respond_to?(:testb)
#       end

#       x.report("UIView respond to existing") do
#         test_view.respond_to?(:testa)
#       end

#       x.report("UIView respond to non existing") do
#         test_view.respond_to?(:testb)
#       end

#       x.report("UIView respond to existing and call it") do
#         test_view.testa if test_view.respond_to?(:testa)
#       end

#       x.report("UIView respond to non existing and don't call it") do
#         test_view.testb if test_view.respond_to?(:testb)
#       end

#       x.report("UIView call existing") do
#         test_view.testa
#       end

#       x.report("STRING: UIView respond to existing") do
#         test_view.respond_to?("testa")
#       end

#       x.report("STRING: UIView respond to non existing") do
#         test_view.respond_to?("testb")
#       end

#       x.report("STRING: UIView respond to existing and call it") do
#         test_view.testa if test_view.respond_to?("testa")
#       end

#       x.report("STRING: UIView respond to non existing and don't call it") do
#         test_view.testb if test_view.respond_to?("testb")
#       end

#       x.report("STRING: UIView call existing") do
#         test_view.testa
#       end

#     end

#     true
#   end
# end



