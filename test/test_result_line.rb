require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports'

module Jmeter
  module SummaryReport
    class TestResultLine < MiniTest::Unit::TestCase
      def test_parse_with_error_line
        line = ResultLine.parse('1355163053904,5933,Login,,"Number of samples in transaction : 2, number of failing samples : 1",Thread Group 1-15,,false,2836,20,20,null,0')
        assert_equal true, line.error?
      end
    end
  end
end
