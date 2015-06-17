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
#  get '/' do
#    "value = " << session[:value].inspect
#  end
#  get '/:value' do
#    session[:value] = paramp['value']
#  end
  get '/' do
    erb :index
  end
#  get '/words/:id' do
#    id = params[:id]
#    word = Word.get(id)
#    if word.nil?
#      "Record of id: #{id} is not found."
#    else
#      word.id.to_s + ": #{word.msg}"
#    end
#  end
  post '/' do
    Word.create(msg: params["ex_text"], uid: "sample")
    Word.all.map do |w|
      w.id.to_s + ": #{w.uid} [#{w.msg}]\n"
    end
  end
#  put '/words/:id' do
#    id = params[:id]
#    word = Word.get(id)
#    if word.nil?
#      'false'
#    else
#      word.update(msg: request.body.gets)
#      'true'
#    end
#  end
#  delete '/words/:id' do
#    id = params[:id]
#    word = Word.get(id)
#    if word.nil?
#      'false'
#    else
#      word.destroy.to_s
#    end
#  end
end
