require 'Haml'
require 'sinatra'
require_relative 'image_uploader'
require_relative 'models/schedule'
require_relative 'models/blogger'
require_relative 'models/outfits'
require_relative 'models/frontview'
require_relative 'models/home'


class PlayerApp < Sinatra::Base
  set    :method_override, true
  set    :root, 'lib/app'
  set    :views, File.dirname(__FILE__) + '/app/views'
  set    :images, File.dirname(__FILE__) + '/app/public/images'
  set    :session_secret, "tardis"
  enable :sessions

  configure do
    enable :sessions
    use RackSessionAccess if environment == :test
  end

  before do
    @schedule = Schedule.first
    @home     = Home.first
    @outfits  = Outfits.all
    @blogger  = Blogger.all
  end

  helpers do
    def authenticate!
      if params[:user] == "ad" && params[:password] == "ad"
        session[:user] == "player"
      end
    end
  end

  get '/' do
    haml :index
  end

  get '/who_we_are' do
    @front_view = FrontView[1]
    haml :who_we_are
  end

  get '/what_we_carry' do
    @front_view = FrontView[2]
    haml :what_we_carry
  end

  get '/what_we_do' do
    @front_view = FrontView[3]
    haml :what_we_do
  end

  get '/outfit_of_the_week' do
    haml :outfit_of_the_week
  end

  get '/gift_cards' do
    @front_view = FrontView[4]
    haml :gift_cards
  end

  get '/find_us' do
    @front_view = FrontView[5]
    haml :find_us
  end

  get '/mvp_club' do
    @front_view = FrontView[6]
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
    else
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

  get '/blogger' do
    @bloggers = Blogger.all
    haml :blogger_main
  end

  get '/contact' do
    haml :contact
  end

  post '/contact' do
    Pony.mail(
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'allieisclever@gmail.com',
      :subject => params[:name] + " has contacted you about Players Clothing",
      :body => params[:message],
      :attachments => {params[:image][:filename] => File.read(params[:image][:tempfile])
      })
    redirect '/success'
  end

  get '/success' do
    haml :success
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

  post '/create_post' do
    @blogger = Blogger.new
    @blogger.set_fields(params[:blogger], [:author, :title, :content, :tag])
    @blogger.created_at = Time.now.to_s
    if @blogger.save
      redirect "/blogger"
    else
      redirect "/admin/new_blogpost"
    end
  end

  get '/admin/new_front_view' do
    @front_view = FrontView.new
    haml :new_front_view
  end

  get '/admin/new_blogpost' do
    @blogger = Blogger.new
    haml :new_blogpost
  end

  get '/admin/edit/:id' do
    @front_view = FrontView[params[:id].to_i]
    haml :edit
  end

  get '/admin/edit_blog/:id' do
    @blogger = Blogger[params[:id].to_i]
    haml :edit_blog
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

  post '/admin/edit_blog/:id' do
    @blogger = Blogger[params[:id].to_i]
    @blogger.set_fields(params[:blogger], [:title, :author, :content, :tag])
    @blogger.created_at = Time.now.to_s
    if @blogger.save
      redirect "/admin/update_dashboard"
    else
      redirect "/admin/edit_blog/#{@blogger.id}"
    end
  end

  post '/admin/update/:id' do
    @front_view = FrontView[params[:id].to_i]
    ImageUploader.load(@front_view, params['image'])
    @front_view.update_fields(params[:front_view], [:title, :description])
    @front_view.updated_at = Time.now.to_s
    if @front_view.save
      redirect "/admin/update_dashboard"
    else
      redirect "/edit/#{@front_view.id}"
    end
  end

  post '/admin/update_blog/:id' do
    @blogger = Blogger[params[:id].to_i]
    @blogger.update_fields(params[:blogger], [:title, :author, :content, :tag])
    @blogger.updated_at = Time.now.to_s
    if @blogger.save
      redirect "/blogger"
    else
      redirect "/edit_blog/#{@blogger.id}"
    end
  end

  get '/admin/update_home' do
    authenticate!
    haml :update_home
  end

  post '/admin/update_home' do
    @home = Home.first
    ImageUploader.load(@home, params['image'])
    if @home.save
      redirect "/admin/update_dashboard"
    end
  end

  get '/admin/update_outfit_of_the_week' do
    authenticate!
    haml :update_outfit_of_the_week
  end

  post '/admin/update_outfit_of_the_week' do
    @outfit = Outfits.create
    ImageUploader.load(@outfit, params['image'])
    @outfit.date = params['date']
    if @outfit.save
      redirect "/admin/update_dashboard"
    end
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
    @schedule = Schedule.first
    @schedule.schedule = params['schedule']['schedule']
    if @schedule.save
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
