# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jmeter/reports'

Gem::Specification.new do |gem|
  gem.name          = "jmeter-reports"
  gem.version       = JmeterReports::VERSION
  gem.authors       = ["Marcos Hack"]
  gem.email         = ["marcos.hack@gmail.com"]
  gem.description   = %q{JMeter Reports}
  gem.summary       = %q{Basic tools for JMeter reports processing.}
  gem.homepage      = "https://github.com/marcoshack/jmeter-reports"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.required_ruby_version = '>= 1.9'

  gem.add_runtime_dependency "descriptive_statistics"
  gem.add_runtime_dependency "formatador"

  gem.add_development_dependency "bundler"  
  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~> 3"
  gem.add_development_dependency "minitest-colorize"
  gem.add_development_dependency "pry"
end
