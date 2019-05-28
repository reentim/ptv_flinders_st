require 'json'
require 'time'
require 'rake/testtask'
require_relative 'app'

Rake::TestTask.new { |task| task.pattern = 'spec/**/*_spec.rb' }

task default: :test

desc "Save departures"
task :save_departures do
  api = Api.new

  route_map = JSON.parse(File.read('public/route_map.json'))
  disruptions = JSON.parse(File.read('public/disruptions.json'))

  departures = api.flinders_st_departures.parse['departures']
    .select { |d| route_map.keys.include?(d['route_id'].to_s) }
    .reject { |d| Time.parse(d['scheduled_departure_utc']) < Time.now }
    .sort   { |a, b| a['scheduled_departure_utc'] <=> b['scheduled_departure_utc'] }
    .map    { |d| d.merge('route_name' => route_map[d['route_id'].to_s]) }
    .map    { |d| d.merge('disruptions' => d['disruption_ids'].map { |id| disruptions.find { |disruption| disruption['disruption_id'] == id }&.slice('title', 'colour') }.compact) }
    .map    { |d| d.slice('route_name', 'platform_number', 'scheduled_departure_utc', 'disruptions') }

  api.save(
    departures.to_json,
    'public/flinders_st_departures.json',
  )
end

desc "Save routes"
task :save_routes do
  api = Api.new
  routes = api.routes.parse['routes']
  route_map = {}
  routes
    .select { |r| r['route_type'] == 0  }
    .map { |r| route_map[r['route_id']] = r['route_name'] }

  api.save(
    route_map.to_json,
    'public/route_map.json',
  )
end

desc "Save disruptions"
task :save_disruptions do
  api = Api.new
  disruptions = api.disruptions.parse['disruptions']['metro_train']
  api.save(
    disruptions.to_json,
    'public/disruptions.json',
  )
end
