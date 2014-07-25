class PlayerApp < Sinatra::Base

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

end
