require 'sinatra/base'
require 'sinatra/reloader'

class Web < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  helpers ERB::Util

  get '/' do
    erb :index
  end
end
