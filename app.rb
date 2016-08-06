require 'sinatra'

get '/' do
  erb :index
end

get '/ch_1' do
  @title = "Software Libre"
  erb :_ch_layout do
    @next = "/ch_2"
    @prev = "/"
    erb :ch_1
  end
end

get '/ch_2' do
  @title = "Software Libre y Código Abierto"
  erb :_ch_layout do
    @next = "/ch_3"
    @prev = "/ch_1"
    erb :ch_2
  end
end

get '/ch_4' do
  @title = "GNU/Linux"
  erb :_ch_layout do
    @next = "/ch_3"
    @prev = "/ch_5"
    erb :ch_2
  end
end

get '/ch_5' do
  @title = "Distribuciones Linux"
  erb :_ch_layout do
    @next = "/ch_6"
    @prev = "/ch_4"
    erb :ch_5
  end
end