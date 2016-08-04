require 'sinatra'

get '/' do
  erb :index
end

get '/ch_1' do
  @next = "/ch_2"
  @prev = "/"
  erb :ch_1
end