require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/summary_report/result_line'

module Jmeter
  module SummaryReport
    class TestResultLine < MiniTest::Unit::TestCase
      def test_parse_simple_error_line
        assert ResultLine.parse('1355332336591,4850,POST execute,500,Internal Server Error,Thread Group 1-70,text,false,15535,75,75,http://stage.id.abril.com.br/widgets/login/execute,4847').error?
      end
      
      def test_parse_transaction_error_line
        assert ResultLine.parse('1355163053904,5933,Login,,"Number of samples in transaction : 2, number of failing samples : 1",Thread Group 1-15,,false,2836,20,20,null,0').error?
      end
    end
  end
end
