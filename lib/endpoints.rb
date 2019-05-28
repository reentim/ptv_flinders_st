# frozen_string_literal: true

module Endpoints
  FLINDERS_ST = 1071

  def departures(route_type:, stop_id:)
    get("/v3/departures/route_type/#{route_type}/stop/#{stop_id}")
  end

  def flinders_st_departures
    departures(route_type: 0, stop_id: FLINDERS_ST)
  end

  def route_directions(route_id:)
    get("/v3/directions/route/#{route_id}")
  end

  def routes
    get("/v3/routes")
  end

  def disruptions
    get("/v3/disruptions")
  end

  def stop_disruptions(stop_id:)
    get("/v3/disruptions/stop/#{stop_id}")
  end

  def flinders_st_disruptions
    stop_disruptions(stop_id: FLINDERS_ST)
  end
end
