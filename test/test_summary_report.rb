require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports'

class TestSummaryReport < MiniTest::Unit::TestCase
  def setup
    fixture = File.expand_path('fixtures/summary_report.csv', File.dirname(__FILE__))
    @report = Jmeter::SummaryReport::Report.create(fixture)
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
end
