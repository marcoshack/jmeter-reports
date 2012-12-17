require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports'

module JmeterReports
  class TestSummary < MiniTest::Unit::TestCase
    def setup
      @report = Summary.create(File.expand_path('fixtures/summary_report1.csv', File.dirname(__FILE__)))
    end

    def test_report_items
      assert_equal 3, @report.items.size
    end

    def test_avg_throughput
      assert_equal 3, @report.avg_throughput
    end

    def test_elapsed_in_ms
      assert_equal 2719, @report.elapsed_in_ms
    end

    def test_elapsed
      assert_equal 3, @report.elapsed
    end
    
    def test_start_date
      assert_equal Time.new(2012,12,11,12,47,32,"+00:00").to_i, @report.start_date.utc.to_i, 'invalid start date'
    end
    
    def test_end_date
      assert_equal Time.new(2012,12,11,12,47,34,"+00:00").to_i, @report.end_date.utc.to_i, 'invalid end date'
    end
  end
end
