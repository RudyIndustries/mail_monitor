require 'rspec/core/rake_task'
require 'highline/import'
require 'yard'

RSpec::Core::RakeTask.new('spec')

YARD::Rake::YardocTask.new('yard')

desc "Run all tasks"
task :default => [:spec]