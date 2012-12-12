module Jmeter
  module SummaryReport
    class ReportItem
      def initialize(label)
        @label = label
        @items = []
        @error_count = 0
      end
      
      def add(line)
        @error_count += 1 if line.error?
        @items << line.elapsed
      end
      
      def size
        @items.size
      end
      
      def errors
        @error_count
      end
      
      def error_rate
        @error_count / self.size.to_f
      end
      
      def text_summary
        sorted_items = @items.sort
        p90 = sorted_items[(self.size * 0.90).round]
        p95 = sorted_items[(self.size * 0.95).round]
        err_rate = round(self.error_rate, 3) * 100
        "#{@label}: #{self.size}/#{self.errors} reqs/err(#{round(self.error_rate, 3) * 100}%), " +
        "90% <= #{p90}ms, 95% <= #{p95}ms"
      end
      
      private
      def round(float_number, dec)
        (float_number * 10**dec).to_i / (10**dec).to_f
      end
    end
  end
end
