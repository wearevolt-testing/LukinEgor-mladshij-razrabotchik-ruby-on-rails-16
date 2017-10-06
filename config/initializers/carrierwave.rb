CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ID'],
    aws_secret_access_key: ENV['AWS_KEY'],
    region: 'eu-central-1'
  }
  config.fog_directory = 'test-amazon-s3-storage'
end
