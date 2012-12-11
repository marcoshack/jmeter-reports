module Jmeter
  module SummaryReport
    class Report
      CSV_HEADER = "timeStamp,elapsed,label,responseCode,responseMessage,threadName,"+
                   "dataType,success,bytes,grpThreads,allThreads,URL,Latency\n"
      
      def initialize
        @items = {}
        @req_count = 0
      end
      
      def self.create(summary_report_file_path)
        report = Report.new
        csv_report = File.open(summary_report_file_path,'r')
        
        unless csv_report.readline == CSV_HEADER
          raise Exception.new("Invalid CSV report: #{summary_report_file_path}")
        end
        
        csv_report.each_line do |line|
          next if line.start_with?("timeStamp,") # ignore header
          report.add(ResultLine.parse(line))
        end
        return report
      end
      
      def add(line)
        @items[line.label] = ReportItem.new(line.label) if @items[line.label].nil?
        @items[line.label].add(line)
        @req_count += 1
        @start = line.timestamp if @start.nil? || line.timestamp < @start
        @end   = line.timestamp if @end.nil?   || line.timestamp > @end
      end
      
      def elapsed_in_ms
        @end - @start
      end
      
      def elapsed
        (self.elapsed_in_ms / 1000.0).ceil
      end
      
      def avg_throughput
        @req_count / self.elapsed
      end
      
      def items
        @items.values
      end
    end
  end
end
