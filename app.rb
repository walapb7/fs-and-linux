require 'sinatra'

get '/' do
  erb :application, layout: false do
    erb :index
  end
end