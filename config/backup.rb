# Backup Configuration File
#
# We use a modified (forked) version of backup 2.4.5.1 which makes
# it possible to send notification via sendmail.

# Initialize with:
#   S3_KEY=mykey S3_SECRET=mysecret rake backup:run trigger='mysql-backup-efueling'
backup 'mysql-backup-efueling' do

  db_config = Rails.configuration.database_configuration[Rails.env]
  s3_credentials = APP_CONFIG["s3_credentials"]

  adapter :mysql do
    user        db_config["username"]
    password    db_config["password"]
    database    db_config["database"]
  end

  storage :s3 do
    access_key_id     s3_credentials["access_key_id"]
    secret_access_key s3_credentials["secret_access_key"]
    bucket            'efueling/backups/mysql'
    use_ssl           true
  end

  # Backup Cleaning
  keep_backups 25

  # Enable Email Notifications
  notify true
end

notifier_settings do

  to    "patrick.baselier@gmail.com"
  from  %{"Backup Notifier" <notifier@efueling.nl>}
  via   :sendmail

  smtp do
    host            "localhost"
    port            "25"
    username        "john"
    password        "secret"
    authentication  "plain"
    domain          "localhost.localdomain"
    tls             false
  end

end
