# Rakefile
require 'open-uri'

desc 'Run iOS testing'
task :ios do
  Dir.chdir 'ios'
  exec 'bundle exec rspec -f html -o report.html'
end

desc 'Run android testing'
task :android do
  Dir.chdir 'android'
  exec 'bundle exec rspec -f html -o report.html'
end

desc 'Download release.apk'
task :pull, :download_url do |t, args|
  args.with_defaults(download_url: 'http://apk.hiapk.com/appdown/com.innodealing.activity')
  download = open(args[:download_url])
  IO.copy_stream(download, './android/build/dealingMatrix-release.apk')
end
