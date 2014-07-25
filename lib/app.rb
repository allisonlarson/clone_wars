require 'Sinatra'
class PlayerApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

  get '/who_we_are/' do
    erb :who_we_are
  end

  get '/what_we_carry/' do
    erb :what_we_carry
  end

  get '/what_we_do/'
    erb :what_we_do
  end

  get '/whats_new/'
    erb :whats_new
  end

  get '/gift_cards/'
    erb :gift_cards
  end

  get '/find_us'
    erb :find_us
  end

  get '/blog/'
    erb :blog
  end

  get '/mvp_club'
    erb :mvp_club
  end

end
