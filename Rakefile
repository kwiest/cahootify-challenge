lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler'

begin
  Bundler.setup :default, :test
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run 'bundle install' to install missing gems."
  exit e.status_code
end

require 'rake/testtask'

task default: :test

desc "Run all tests"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end
