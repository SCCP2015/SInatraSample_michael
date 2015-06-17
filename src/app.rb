# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'
#require_relative 'word'
require_relative 'word2'
require 'sinatra'

#enable :sessions

DataMapper::Logger.new($stdout, :debug)
#DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')
DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp2')

# Sinatra Main controller
class MainApp < Sinatra::Base
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/userlist.erb' do
    erb :userlist
  end

  post '/' do
    Word.create(msg: params["ex_text"], uid: "sample")
    Word.all.map do |w|
      w.id.to_s + ": #{w.uid} [#{w.msg}]\n"
    end
  end

end
