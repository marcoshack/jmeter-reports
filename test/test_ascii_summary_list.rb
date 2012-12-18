require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports/views/ascii_summary_list'

module JmeterReports
  module Views
    class TestAsciiSummaryList < MiniTest::Unit::TestCase
      def setup
        @files = Dir.glob(File.expand_path('fixtures/*', File.dirname(__FILE__)))
      end
      
      def test_render
        AsciiSummaryList.new(@files).render
      end
    end
  end
end
