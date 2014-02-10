BUNDLE_ID    = "co.randompaper.qiita.alfred"
PACKAGE_FILE = "info.plist"

workflow_home     = File.expand_path('~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows')
dbx_workflow_path = File.expand_path('~/Dropbox/アプリ/Alfred.alfredpreferences/workflows')

desc "Link to Alfred"
task :link => [:configure] do
  ln_sf File.expand_path('../', __FILE__), File.join(workflow_home, BUNDLE_ID)
end

desc "Unlink from Alfred"
task :unlink => [:configure] do
  rm File.join(workflow_home, BUNDLE_ID)
end

desc "Install to Alfred Sync folder on Dropbox"
task :link_dropbox => [:configure] do
  ln_sf File.expand_path('../', __FILE__), File.join(dbx_workflow_path, BUNDLE_ID)
end

desc "Unlink from Alfred Sync folder on Dropbox"
task :unlink_dropbox => [:configure] do
  rm File.join(dbx_workflow_path, BUNDLE_ID)
end