# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mail_monitor/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "mail_monitor"
  gem.authors     = ["Kurt Robert Rudolph"]
  gem.email       = ["rudolph.kurt@rudyindustries.com"]
  gem.description = "Monitors a mailbox"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mail_monitor"
  gem.require_paths = ["lib"]
  gem.version       = MailMonitor::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.add_dependency('mail', '~> 2.4.4')
  gem.add_development_dependency('yard')
  gem.add_development_dependency('redcarpet') # TODO: This was needed for markdown 
                                              # support when running a `yard server` from the command line.
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake','~> 0.9.2')
end