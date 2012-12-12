require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports/version'

module Jmeter
  module Reports
    class TestVersion < MiniTest::Unit::TestCase
      def test_version
        assert Jmeter::Reports::VERSION != nil
      end
    end
  end
end
