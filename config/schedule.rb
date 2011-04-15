# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :job_template, "bash -l -i -c ':job'" # We need to add -i as an extra option, see https://github.com/javan/whenever/issues/106

every :day do
  # Periodically test the Exception Notifier
  command "wget -q http://efueling.nl/test_exception_notifier"
end


every :day do
  # Backup the database and save it to Amazon S3.
  #
  # Amazon S3 credentials should be set as environment variables:
  #   export S3_KEY=mykey
  #   export S3_SECRET=mysecret
  rake 'backup:run trigger="mysql-backup-efueling"'
  # => 'cd /var/www/e-fueling/releases/20110413044942 && RAILS_ENV=production rake backup:run trigger="mysql-backup-efueling" --silent'
end