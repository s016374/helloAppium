# Rakefile
require 'open-uri'

desc 'Run iOS + android testing'
task :default do
  Rake::Task[:ios].invoke
  Rake::Task[:android].invoke
end

desc 'Run iOS testing'
task :ios do
  puts 'execute ios automation ...'
  Dir.chdir 'ios'
  exec 'bundle exec rspec -f html -o report.html'
end

desc 'Run android testing'
task :android do
  puts 'execute android automation ...'
  Dir.chdir 'android'
  exec 'bundle exec rspec -f html -o report.html'
end

desc 'Download release.apk, eg: rake pull_apk[https://192.168.8.189:18080/svn/DM-AppMarket/Developer/app2.3/prod/201610261150/DealingMatrix.apk]'
task :pull_apk, :download_url do |t, args|
  puts "download .apk from #{args[:download_url]} ..."
  # TODO Is it necessary to remove .apk last version?
  args.with_defaults(download_url: 'https://192.168.8.189:18080/svn/DM-AppMarket/Developer/app2.3/prod/201610261150/DealingMatrix.apk')
  download = open(args[:download_url])
  IO.copy_stream(download, './android/build/dealingMatrix-release.apk')
end

desc 'Download ad-hoc ios build, eg: rake pull_app[https://192.168.8.189:18080/svn/DM-AppMarket/Developer/app2.3/prod/201610261150/DMProject.ipa]'
task :pull_app, :download_url do |t, args|
  puts "download .app from #{args[:download_url]} ..."
  # TODO Is it necessary to remove .apk last version?
  args.with_defaults(download_url: 'https://192.168.8.189:18080/svn/DM-AppMarket/Developer/app2.3/prod/201610261150/DealingMatrix.zip')
  download = open(args[:download_url])
  IO.copy_stream(download, './ios/build/DealingMatrix.zip')
end
