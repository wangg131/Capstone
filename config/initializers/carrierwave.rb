CarrierWave.configure do |config|
  config.storage          = :aws
  config.aws_bucket       = ENV['S3_BUCKET_NAME']
  config.aws_acl          = 'public-read'
  config.aws_credentials  = {
    access_key_id:          ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key:      ENV['AWS_SECRET_ACCESS_KEY'],
    region:                 ENV['S3_REGION']
    }

    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars

    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret
    # S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku

end
