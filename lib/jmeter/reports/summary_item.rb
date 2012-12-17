require 'descriptive_statistics'

module JmeterReports
  class SummaryItem
    def initialize(label)
      @label = label
      @items = []
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
      @req_count / self.elapsed.to_f
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
    
    def table_data
      sorted_items = @items.sort
      {
        :label      => "[green]#{@label}[/]", 
        :reqs       => self.size, 
        :errors     => (self.errors > 0 ? "[red]#{self.errors}[/]" : self.errors), 
        :err_pct    => round(self.error_rate * 100, 1),
        :avg_thrput => "[yellow]#{round(self.avg_throughput, 3)}[/]", 
        :min        => @items.min,
        :avg        => "[yellow]#{@items.reduce { |n,s| s += n } / @items.size}[/]", 
        :max        => @items.max,
        :sd         => "[yellow]#{@items.standard_deviation.to_i}[/]", 
        :pct_90     => "#{sorted_items[(self.size * 0.90).round]}",
        :pct_95     => "#{sorted_items[(self.size * 0.95).round]}"
      }
    end
    
    private
    def round(float_number, dec)
      (float_number * 10**dec).to_i / (10**dec).to_f
    end
  end
end
