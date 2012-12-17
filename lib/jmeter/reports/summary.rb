module JmeterReports
  class Summary
    CSV_HEADER = "timeStamp,elapsed,label,responseCode,responseMessage,threadName,"+
                 "dataType,success,bytes,grpThreads,allThreads,URL,Latency\n"
    
    def initialize
      @items = {}
      @req_count = 0
    end
    
    def self.create(summary_report_file_path)
      report = Summary.new
      csv_report = File.open(summary_report_file_path,'r')
      
      unless csv_report.readline == CSV_HEADER
        raise Exception.new("Invalid CSV report: #{summary_report_file_path}")
      end
      
      csv_report.each_line do |line|
        next if line.start_with?("timeStamp,") # ignore header
        report.add(SummaryLine.parse(line))
      end
      return report
    end
    
    def add(line)
      @items[line.label] = SummaryItem.new(line.label) if @items[line.label].nil?
      @items[line.label].add(line)
      @req_count += 1
      @start_ms = line.timestamp if @start_ms.nil? || line.timestamp < @start_ms
      @end_ms   = line.timestamp if @end_ms.nil?   || line.timestamp > @end_ms
    end
    
    def elapsed_in_ms
      @end_ms - @start_ms
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
    
    def total_requests
      @req_count
    end
    
    def start_date
      Time.at(@start_ms / 1000.0)
    end
    
    def end_date
      Time.at(@end_ms / 1000.0)
    end
    
    def table_data
      @items.values.collect { |i| i.table_data }
    end
  end
end
