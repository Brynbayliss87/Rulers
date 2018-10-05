require "bundler/gem_tasks"
task :default => :spec
require "rake/testtask"
Rake::TestTask.new do |t|
 t.name = "test" # this is the default
 t.libs << "test" # load the test dir
 t.test_files = Dir['test/*test*.rb']
 t.verbose = true
end
