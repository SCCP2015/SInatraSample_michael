# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'db_system'

# Sinatra Main controller
class MainApp < Sinatra::Base
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end
  get '/' do
    Database.instance.get
  end
  post '/' do
    body = request.body.gets
    Database.instance.post(body)
  end
  put '/' do
    body = request.body.gets
    Database.instance.put(body)
  end
  delete '/' do
    Database.instance.delete
  end
end
