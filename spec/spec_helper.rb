require 'active_model'
require 'rspec'
require 'faraday'
require 'json'
require 'vcr'
require 'webmock/rspec'
require 'vcr'

require './env'
require 'mail_wrap'
require 'email'
require 'unsubscriber'




VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock 
end
