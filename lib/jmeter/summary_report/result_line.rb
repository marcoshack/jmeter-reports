# Representation of a summary report result line.
#
# Header:
#   timeStamp,elapsed,label,responseCode,responseMessage,threadName,dataType,
#   success,bytes,grpThreads,allThreads,URL,Latency
#
# Line example:
#   1355164382383,97,Tela de Login,200,"Number of samples in transaction : 1, 
#   number of failing samples : 0",Thread Group 1-1,,true,5168,1,1,null,0
#
module Jmeter
  module SummaryReport
    class ResultLine
      attr_accessor :timestamp, :elapsed, :label, :error, :latency
      
      def self.parse(line)
        t,e,l,rc,rm,_,_,s,_,_,_,_,lt = line.split(",")
        res = Jmeter::SummaryReport::ResultLine.new
        res.timestamp = t.to_i
        res.elapsed   = e.to_i
        res.label     = l
        res.error     = (s == "false" ? true : false)
        res.latency   = lt.to_i
        return res
      end
      
      def error?
        self.error
      end
    end
  end
end
