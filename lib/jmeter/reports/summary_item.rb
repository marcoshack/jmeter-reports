require 'descriptive_statistics'

module JmeterReports
  class SummaryItem
    def initialize(label)
      @label       = label
      @items       = []
      @error_count = 0
      @req_count   = 0
    end
    
    def add(line)
      @error_count += 1 if line.error?
      @items       << line.elapsed
      @req_count   += 1
      @start_ms    = line.timestamp if @start_ms.nil? || line.timestamp < @start_ms
      @end_ms      = line.timestamp if @end_ms.nil?   || line.timestamp > @end_ms
    end
    
    def elapsed_in_ms
      @end_ms - @start_ms
    end
    
    def elapsed
      (self.elapsed_in_ms / 1000.0).ceil
    end
    
    def avg_throughput
      @req_count > 1 ? @req_count / self.elapsed.to_f : 0.0
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
    
    def percentil(percentil)
      @items.sort[((percentil / 100.0) * @items.size).ceil]
    end
    
    def min
      @items.min
    end
    
    def avg
      @items.reduce { |n,s| s += n } / @items.size
    end
    
    def max
      @items.max
    end
    
    def sd
      @items.standard_deviation.to_i
    end

    def label
      @label
    end
  end
end
