# frozen_string_literal: true

module Endpoints
  def departures(route_type:, stop_id:)
    get("/v3/departures/route_type/#{route_type}/stop/#{stop_id}")
  end

  def route_directions(route_id:)
    get("/v3/directions/route/#{route_id}")
  end
end
