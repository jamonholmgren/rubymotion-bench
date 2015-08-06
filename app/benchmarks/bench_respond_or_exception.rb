class BenchRespondOrExceptionTest
end

class BenchRespondOrException
  def perform
    test = BenchRespondOrExceptionTest.new

    Benchmark.ips do |x|
      x.report("Checking if a method will respond_to? a method that doesn't exist") do |iterations|
        iterations.times do |i|
          if test.respond_to?(:foo)
            test.send(:foo)
          else
            # Warn the user
          end
        end
      end

      x.report("Sending to a method that doesn't exist and rescuing the exception") do |iterations|
        iterations.times do |i|
          begin
            test.public_send(:foo)
          rescue NoMethodError => e
            # Warn the user
          end
        end
      end

    end
  end
end
