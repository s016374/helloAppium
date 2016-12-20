# Rakefile

desc 'Run iOS testing'
task :ios do
  Dir.chdir 'ios'
  exec 'bundle exec rspec -f html -o report.html'
end

desc 'Run android testing'
task :android do
  Dir.chdir 'android'
  # exec 'bundle exec rspec -f html -o report.html'
  exec 'bundle exec rspec'
end
