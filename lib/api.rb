# frozen_string_literal: true

require 'openssl'
require 'uri'

class Api
  def initialize(device_id, secret_key)
    @device_id = device_id
    @secret_key = secret_key
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
