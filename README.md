# JMeter Reports [![Build Status](https://travis-ci.org/marcoshack/jmeter-reports.png?branch=master)](https://travis-ci.org/marcoshack/jmeter-reports)

Command-line tools for JMeter report processing. Right now it supports only CSV summary reports processing to show:

* Test execution time
* Total and transaction throughputs
* Transaction samples/errors
* Min / Avg / Max / Standard Deviation
* 90 and 95 response time percentiles

Example:

                 Start: 2012-12-14 16:22:53 -0200
                   End: 2012-12-14 16:28:33 -0200
              Duration: 340 secs
        Total requests: 10520
    Average throughput: 30 RPS

    +--------------------------+------+--------+---------+-----+------+-------+--------+------------+
    | label                    | reqs | errors | err_pct | min | avg  | max   | sd     | avg_thrput |
    +--------------------------+------+--------+---------+-----+------+-------+--------+------------+
    | GET session/new          | 2651 | 18     | 0.6     | 49  | 742  | 10062 | 1576ms | 7.797 RPS  |
    +--------------------------+------+--------+---------+-----+------+-------+--------+------------+
    | POST session             | 2629 | 562    | 21.3    | 272 | 3104 | 10093 | 3882ms | 7.732 RPS  |
    +--------------------------+------+--------+---------+-----+------+-------+--------+------------+
    | GET session/:id          | 2620 | 0      | 0.0     | 21  | 227  | 8099  | 682ms  | 7.705 RPS  |
    +--------------------------+------+--------+---------+-----+------+-------+--------+------------+
    | Login                    | 2620 | 570    | 21.7    | 377 | 4185 | 25724 | 4401ms | 7.705 RPS  |
    +--------------------------+------+--------+---------+-----+------+-------+--------+------------+

# Install

Requires Ruby >= 1.9

    gem install jmeter-reports
  
# Usage

    jmeter-reports <path_to_summary_report_file.csv>

