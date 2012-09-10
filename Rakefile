require 'bundler'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'
require 'yard'

include Rake::DSL

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new('spec')

YARD::Rake::YardocTask.new('yard')

Cucumber::Rake::Task.new('features')


task :default => [:spec,:features]
