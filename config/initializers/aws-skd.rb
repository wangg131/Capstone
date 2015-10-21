# log level defaults to :info
Aws.config[:log_level] = :debug
Aws.config[:credentials] = Aws::Credentials.new(access_key, secret)
Aws.config.update({
  region: 'us-west-2',
  credentials: Aws::Credentials.new('akid', 'secret'),
})
