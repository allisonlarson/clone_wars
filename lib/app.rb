require 'Haml'
require 'sinatra'

class PlayerApp < Sinatra::Base
  set :method_override, true
  set :root, '/lib/app'
  set :views, File.dirname(__FILE__) + '/app/views'

  configure do
    enable :sessions
  end

  helpers do
    def authenticate!
      if params[:user] == "ad" && params[:password] == "ad"
        session[:user] == "admin"
      end
    end
  end

  not_found do
    haml :error
  end

  get '/' do
    haml :index
  end

  get '/who_we_are' do
    haml :who_we_are
  end

  get '/what_we_carry' do
    haml :what_we_carry
  end

  get '/what_we_do' do
    haml :what_we_do
  end

  get '/outfit_of_the_week' do
    haml :outfit_of_the_week
  end

  get '/gift_cards' do
    haml :gift_cards
  end

  get '/find_us' do
    haml :find_us
  end

  get '/blog' do
    haml :blog
  end

  get '/mvp_club' do
    haml :mvp_club
  end

  get '/login' do
    haml :login
  end

  post '/login' do
    if params[:user] == "ad" && params[:password] == "ad"
      session[:user] = "player"
      redirect '/admin/update_dashboard'
    elsegit ad
      redirect '/'
    end
  end

  get '/logout' do
    haml :index
    session[:user] = nil
    redirect '/'
  end

  get '/not_here' do
    haml :not_here
  end

  get '/admin/update_dashboard' do
    authenticate!
    haml :update_dashboard
  end

  get '/admin/update_home' do
    authenticate!
    haml :update_home
  end

  get '/admin/update_who_we_are' do
    authenticate!
    haml :update_who_we_are
  end

  get '/admin/update_what_we_carry' do
    authenticate!
    haml :update_what_we_carry
  end

  get '/admin/update_what_we_do' do
    authenticate!
    haml :update_what_we_do
  end

  get '/admin/update_outfit_of_the_week' do
    authenticate!
    haml :update_outfit_of_the_week
  end

  get '/admin/update_gift_cards' do
    authenticate!
    haml :update_gift_cards
  end

  get '/admin/update_find_us' do
    authenticate!
    haml :update_find_us
  end

  get '/admin/update_blog' do
    authenticate!
    haml :update_blog
  end

  get '/admin/update_schedule' do
    authenticate!
    haml :update_schedule
  end

end
