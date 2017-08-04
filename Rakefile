lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rake/testtask'
require 'minitest/pride'

task default: :test

desc "Run all tests"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end
