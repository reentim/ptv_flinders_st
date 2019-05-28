# frozen_string_literal: true

require 'json'

class Response
  attr_reader :json

  def initialize(response)
    @json = response
  end

  def parse
    JSON.parse(@json)
  end
end
