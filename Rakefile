require 'yaml'
require 'plist'

config_file = 'config.yml'
workflow_home = File.expand_path('~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows')

$config = YAML.load_file config_file
$config['bundleid'] = "#{$config['domain']}.#{$config['id']}"
$config['package_file'] = File.join($config['path'], 'info.plist')
$config['dbx_workflow_path'] = File.join(File.expand_path($config['dropbox']), '/Alfred.alfredpreferences/workflows')

desc "Generate a plist file for Alfred from config.yml"
task :configure do
  package = Plist::parse_xml $config['package_file']

  unless package['bundleid'].eql?($config["bundleid"])
    package['bundleid'] = $config['bundleid']
    File.open($config['package_file'], 'wb') do |f|
      f.write package.to_plist
    end
  end
end

desc "Link to Alfred"
task :link => [:configure] do
  ln_sf File.expand_path($config["path"]), File.join(workflow_home, $config["bundleid"])
end

desc "Unlink from Alfred"
task :unlink => [:configure] do
  rm File.join(workflow_home, $config["bundleid"])
end

desc "Install to Alfred Sync folder on Dropbox"
task :install => [:configure] do
  ln_sf File.expand_path($config["path"]), File.join($config["dbx_workflow_path"], $config["bundleid"])
end

desc "Unlink from Alfred Sync folder on Dropbox"
task :uninstall => [:configure] do
  rm File.join($config["dbx_workflow_path"], $config["bundleid"])
end
