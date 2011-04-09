##
# Backup
# Generated Template
#
# For more information:
#
# View the Git repository at https://github.com/meskyanichi/backup
# View the Wiki/Documentation at https://github.com/meskyanichi/backup/wiki
# View the issue log at https://github.com/meskyanichi/backup/issues
#
# When you're finished configuring this configuration file,
# you can run it from the command line by issuing the following command:
#
# $ backup perform -t efeuling_backup -c config/backup/config.rb

db_config = Rails.configuration.database_configuration[Rails.env]

Backup::Model.new(:efeuling_backup, 'e-fueling Backup') do

  database MySQL do |db|
    db.name               = db_config["database"]
    db.username           = db_config["username"]
    db.password           = db_config["password"]
    db.host               = db_config["host"]
    db.port               = db_config["port"]
    db.socket             = db_config["socket"]
    # db.skip_tables        = ['skip', 'these', 'tables']
    # db.only_tables        = ['only', 'these' 'tables']
    db.additional_options = ['--quick', '--single-transaction']
  end

  store_with S3 do |s3|
    s3.access_key_id      = 'my_access_key_id'
    s3.secret_access_key  = 'my_secret_access_key'
    s3.region             = 'us-east-1'
    s3.bucket             = 'bucket-name'
    s3.path               = '/path/to/my/backups'
    s3.keep               = 10
  end

  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end

  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_failure           = true

    mail.from                 = 'sender@email.com'
    mail.to                   = 'receiver@email.com'
    mail.address              = 'smtp.gmail.com'
    mail.port                 = 587
    mail.domain               = 'your.host.name'
    mail.user_name            = 'sender@email.com'
    mail.password             = 'my_password'
    mail.authentication       = 'plain'
    mail.enable_starttls_auto = true
  end

end

