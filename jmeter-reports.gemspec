# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "jmeter-reports"
  gem.version       = "0.0.2"
  gem.authors       = ["Marcos Hack"]
  gem.email         = ["marcos.hack@gmail.com"]
  gem.description   = %q{JMeter Reports}
  gem.summary       = %q{Basic tools for JMeter reports processing.}
  gem.homepage      = "https://github.com/marcoshack/jmeter-reports"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~> 3"
end
