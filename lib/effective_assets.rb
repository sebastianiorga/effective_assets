require "effective_assets/engine"
require 'carrierwave'
require 'migrant'     # Required for rspec to run properly

module EffectiveAssets
  # The following are all valid config keys
  mattr_accessor :aws_bucket
  mattr_accessor :aws_access_key_id
  mattr_accessor :aws_secret_access_key
  mattr_accessor :aws_upload_path
  mattr_accessor :aws_acl

  def self.setup
    yield self
  end

  def aws_upload_path
    Rails.logger.ifno "AWS UPLOAD PATH"
    @aws_upload_path || 'uploads/'
  end
end
