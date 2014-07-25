BUNDLE_ID    = "co.randompaper.qiita.alfred"
PACKAGE_FILE = "info.plist"

ALFRED_WORKFLOW_PATH = ENV['ALFRED_WORKFLOW_PATH'] || File.expand_path('~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows')

task :default => :spec

desc "Link to Alfred"
task :link do
  ln_sf File.expand_path('../', __FILE__), File.join(ALFRED_WORKFLOW_PATH, BUNDLE_ID)
end

desc "Unlink from Alfred"
task :unlink do
  rm File.join(ALFRED_WORKFLOW_PATH, BUNDLE_ID)
end

require 'rspec/core/rake_task'

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.verbose = false
end
