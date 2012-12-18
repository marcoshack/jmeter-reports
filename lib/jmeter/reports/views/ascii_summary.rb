module JmeterReports
  module Views
    class AsciiSummary
      HEADERS = [:label,:reqs,:errors,:err_pct,:min,:avg,:max,:sd,:avg_thrput,:pct_90,:pct_95]
    
      def initialize(report)
        @report = report
      end
    
      def report_data(color = true)
        data = []
        @report.items.each do |i|
          data << {
            :label      => (color ? "[green]#{i.label}[/]" : i.label), 
            :reqs       => i.size, 
            :errors     => (i.errors > 0 && color ? "[red]#{i.errors}[/]" : i.errors),
            :err_pct    => (i.error_rate * 100).round(1),
            :avg_thrput => "[yellow]#{i.avg_throughput.round(3)}[/]", 
            :min        => i.min,
            :avg        => "[yellow]#{i.avg}[/]", 
            :max        => i.max,
            :sd         => color ? "[yellow]#{i.sd}[/]" : i.sd, 
            :pct_90     => i.percentil(90),
            :pct_95     => i.percentil(95)
          }
        end
        return data
      end
    
      def render
        puts ""
        puts "             Start: #{@report.start_date}"
        puts "               End: #{@report.end_date}"
        puts "          Duration: #{@report.elapsed} secs"
        puts "    Total requests: #{@report.total_requests}"
        puts "Overall throughput: #{@report.avg_throughput} RPS"
        puts ""
        Formatador.display_compact_table(report_data, HEADERS)
        puts ""
        puts "  Time values in milliseconds and throughput in Requests Per Second."
        puts ""
      end
    end
  end
end