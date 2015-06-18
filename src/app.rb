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
    @Obj = Word.all
    erb :index
  end

  get '/userlist.erb' do
    @Obj = User.all
    erb :userlist
  end

  post '/' do
    user = User.first(:uid => params["uid"])
    if params["uid"]=='' || params["msg"]=='' || params["pass"]==''
      erb :error
    else
      if user.nil?
        User.create(uid: params["uid"], pass: params["pass"])
        Word.create(msg: params["msg"], uid: params["uid"])
        @Obj = Word.all
        erb :index
      else
        if user.pass == params["pass"]
          Word.create(msg: params["msg"], uid: params["uid"])
          @Obj = Word.all
          erb :index
        else
          erb :error
        end
      end
    end
  end
end
