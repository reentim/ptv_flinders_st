# frozen_string_literal: true

require 'net/http'
require 'openssl'
require 'uri'

require_relative 'response'
require_relative 'endpoints'

class Api
  include Endpoints

  def initialize(device_id = nil, secret_key = nil)
    @device_id = device_id || ENV.fetch('PTV_API_DEVID')
    @secret_key = secret_key || ENV.fetch('PTV_API_SECRET')
  end

  def save(data, file_name)
    File.open(file_name, 'w') do |file|
      file << data
    end
  end

  def get(path)
    Response.new(
      Net::HTTP.get(URI(url(path))),
    )
  end

  def url(path)
    "http://timetableapi.ptv.vic.gov.au#{path}?#{query(path)}"
  end

  private

  attr_reader :device_id, :secret_key

  def query(path)
    "devid=#{device_id}&signature=#{signature(path)}"
  end

  def signature(path)
    data = "#{path}?devid=#{device_id}"
    OpenSSL::HMAC.hexdigest('sha1', secret_key, data).upcase
  end
end
