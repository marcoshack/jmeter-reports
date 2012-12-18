require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports/views/ascii_summary'

module JmeterReports
  module Views
    class TestAsciiSummary < MiniTest::Unit::TestCase
      def setup
        @report = ::JmeterReports::Summary.create(File.expand_path('fixtures/summary_report1.csv', File.dirname(__FILE__)))
      end
      
      def test_render
        AsciiSummary.new(@report).render
      end
    end
  end
end
