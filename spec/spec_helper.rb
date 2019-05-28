# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest-vcr'
require 'vcr'

DEVICE_ID = ENV.fetch('PTV_API_DEVID')
SECRET_KEY = ENV.fetch('PTV_API_SECRET')

FAKE_SIGNATURE = '9bf3d4daf9a1873a16869b16e630248a997e1f89'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.filter_sensitive_data('1234') { DEVICE_ID }
  config.before_record do |interaction|
    interaction.request.uri.gsub!(/signature=.*$/, "signature=#{FAKE_SIGNATURE}")
  end
  config.default_cassette_options = { match_requests_on: [:path] }
  config.hook_into :webmock
end

MinitestVcr::Spec.configure!
