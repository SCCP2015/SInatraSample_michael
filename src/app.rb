# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'
require_relative 'word'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')

# Sinatra Main controller
class MainApp < Sinatra::Base
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end
  get '/words' do
    words = Word.all.map do |w|
      w.id.to_s + ": #{w.msg}"
    end
    words.join(',')
  end
  get '/words/:id' do
    id = params[:id]
    word = Word.get[:id]
    if word.nil?
      "Record of id: #{jd} is not found."
    else
      word.id.to_s + ": #{word.msg}"
    end
  end
  post '/words' do
    # bodyの文字列をmsgとして、新しいwordレコードを一件追加。
    # レスポンスとして追加時のレコードのidを返す。
  end
  put '/words/:id' do
    # パラメータidに対応するwordsテーブルのレコード一件を更新。
    # 成功した場合、"true" 失敗した場合、"false"をレスポンスとして返す。
  end
  delete '/words/:id' do
    # パラメータidに対応するwordsテーブルのレコード一件を削除。
    # 成功した場合、"true" 失敗した場合、"false"をレスポンスとして返す。
  end
end
