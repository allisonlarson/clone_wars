require 'Haml'
require_relative 'models'
require 'sinatra'
require 'pry'


class PlayerApp < Sinatra::Base
  set :method_override, true
  set :root, '/lib/app'
  set :views, File.dirname(__FILE__) + '/app/views'
  enable :sessions
  # use RackSessionAccess unless environment == :test

  configure do
    enable :sessions
  end

  before do
    @front_view = FrontView.last
  end

  helpers do
    def authenticate!
      if params[:user] == "ad" && params[:password] == "ad"
        session[:user] == "admin"
      end
    end
  end

  # before every action, set @front_view
  # before_filter

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
    if session[:user] == "player"
      redirect "/admin/update_dashboard"
    else
      haml :login
    end
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
    front_views = FrontView.all
    front_view  = FrontView.last
    haml :update_dashboard
  end

  post '/create' do
    @front_view = FrontView.new
    @front_view.set_fields(params[:front_view], [:title, :description, :image_file])
    @front_view.created_at = Time.now.to_s
    if @front_view.save
      redirect "/admin/update_dashboard"
    else
      redirect "/admin/new_front_view"
    end
  end

  post 'admin/update/:id' do
    @form_view = FrontView[params[:id].to_i]
    @front_view.set_fields(params[:front_view], [:title, :description, :image_file])
    @form_view.updated_at = Time.now.to_s
    if @form_view.save
      redirect "/"
    else
      redirect "admin/edit/#{@form_view.id}"
    end
  end

  get '/admin/new_front_view' do
    @front_view = FrontView.new
    haml :new_front_view
  end

  get '/admin/edit/:id' do
    @front_view = FrontView[params[:id].to_i]
    haml :edit
  end

  post '/admin/edit/:id' do
    @front_view = FrontView[params[:id].to_i]
    @front_view.set_fields(params[:front_view], [:title, :description, :image_file])
    @front_view.created_at = Time.now.to_s
    if @front_view.save
      redirect "/admin/update_dashboard"
    else
      redirect "/admin/edit/#{@front_view.id}"
    end
  end

  post '/admin/update/:id' do
    @front_view = FrontView[params[:id].to_i]
    @front_view.update_fields(params[:front_view], [:title, :description, :image_file])
    @front_view.updated_at = Time.now.to_s
    if @front_view.save
      redirect "/admin/update_dashboard"
    else
      redirect "/edit/#{@front_view.id}"
    end
  end

  get '/admin/update_home' do
    authenticate!
    haml :update_home
  end

  get '/admin/update_who_we_are' do
    authenticate!
    @front_view = FrontView.new
    haml :update_who_we_are, locals: {action: "post", route: "/create"}
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

  post '/admin/update_schedule' do
    @front_view = FrontView.last
    @front_view.schedule = params['front_view']['schedule']
    @front_view.created_at = Time.now.to_s
    if @front_view.save
      redirect "/admin/update_dashboard"
    else
      redirect "/admin/edit/"
    end
  end

  get '/db' do
    insert_into_tb_regular_view
    results = @database.fetch "SELECT * from people;"
    print results.to_a
  end

end
