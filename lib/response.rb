# frozen_string_literal: true

class Response
  attr_reader :json

  def initialize(response)
    @json = response
  end
end
