require 'sinatra'
require 'byebug'
enable :sessions

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
    erb :ch_4
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

get '/test' do
  erb :test_intro
end
# Here begins the test activities
# it will be a sequence test so each activity result
# is stored on session value to give the final result
# after the last activity is done

# Select the correct answer
get '/eval_1' do
  erb :eval_1
end

# Drag and drop the matching term
post '/eval_2' do
  session[:eval_1] = eval_1(params)
  erb :eval_2 , layout: false
end

# Alphabet Soup
get '/eval_3' do
  session[:eval_2] = eval_2(params)
  erb :eval_3#, layout: false
end

# True and False
post '/eval_4' do
  erb :eval_4, layout: false
end

# Puzzle
get '/eval_5' do
  session[:eval_4] = eval_4(params)
  erb :eval_5#, layout: false
end

# Evaluation Functions
def eval_1(data)
  points = 0
  points +=1 if data[:selectionOne] == "option2"
  points +=1 if data[:selectionTwo] == "option2"
  points +=1 if data[:selectionThree] == "option3"
  points +=1 if data[:selectionFour] == "option3"
  return points
end

def eval_2(data)
  points = 0
  points +=1 if data[:drop_1] == "1"
  points +=1 if data[:drop_2] == "2"
  points +=1 if data[:drop_3] == "3"
  return points
end

def eval_4(data)
  points = 0
  points +=1 if data[:selectionOne] == "option1"
  points +=1 if data[:selectionTwo] == "option2"
  points +=1 if data[:selectionThree] == "option1"
  points +=1 if data[:selectionFour] == "option2"
  points +=1 if data[:selectionFour] == "option2"
  return points
end