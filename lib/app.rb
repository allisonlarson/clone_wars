require 'Sinatra'
class PlayerApp < Sinatra::Base

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

  get '/who-we-are/' do
    erb :who_we_are
  end


end
