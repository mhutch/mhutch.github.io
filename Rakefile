require 'html-proofer'

task :default do
  sh("bundle exec jekyll build")
end

task :run do
  sh("bundle exec jekyll serve --incremental")
end

task :profile do
  sh("bundle exec jekyll build --profile")
end

task :doctor do
  sh("bundle exec jekyll doctor")
end

task :test => [ :default, :doctor ] do
  options = { :assume_extension => true, :disable_external => true }
  HTMLProofer.check_directory("./_site", options).run
end