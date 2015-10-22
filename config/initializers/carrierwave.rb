CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars

    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret
    # S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    provider:               'AWS',
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
    region:                 'us-west-2'
    }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku

  config.fog_directory = ENV['S3_BUCKET_NAME']
  # config.fog_public     = false
  config.fog_authenticated_url_expiration = 600
  # config.s3_access_policy = :public_read
  # config.fog_host       = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"

end
