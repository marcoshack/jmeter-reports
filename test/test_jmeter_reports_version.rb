require File.expand_path('helper', File.dirname(__FILE__))
require 'jmeter/reports'

module JmeterReports
  class TestVersion < MiniTest::Unit::TestCase
    def test_version
      assert JmeterReports::VERSION != nil
    end
  end
end
