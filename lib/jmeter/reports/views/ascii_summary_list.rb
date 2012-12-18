module JmeterReports
  module Views
    class AsciiSummaryList
      HEADERS = [:filename,:start,:end,:samples,:avg_thrput]
      
      def initialize(files)
        @files = files
      end
      
      def report_data(color = true)
        data = []
        @files.each do |filename|
          r = JmeterReports::Summary.create(filename)
          data << { 
            :filename   => (color ? "[yellow]#{File.basename(filename)}[/]" : File.basename(filename)), 
            :start      => r.start_date, 
            :end        => r.end_date, 
            :samples    => (color ? "[blue]#{r.total_requests}[/]" : r.total_requests), 
            :avg_thrput => "#{r.avg_throughput} RPS" 
          }
        end
        return data
      end
      
      def render
        Formatador.display_compact_table(report_data, HEADERS)
      end
    end
  end
end
