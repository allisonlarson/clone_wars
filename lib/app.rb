require 'Haml'

class PlayerApp < Sinatra::Base
  set :method_override, true
  set :root, '/lib/app'
  set :views, File.dirname(__FILE__) + '/app/views'
  # set :public, File.dirname(__FILE__) + '/app/public'

  # helpers do
  #   def partial template
  #     haml template, :layout => false
  #   end
  # end

  # not_found do
  #   haml :error
  # end

  get '/' do
    haml :index
  end

  get '/admin' do
    haml :admin
  end

  get '/admin/update_home' do
    haml :update_home
  end

  get '/admin/update_who_we_are' do
    haml :update_who_we_are
  end

  get '/admin/update_what_we_carry' do
    haml :update_what_we_carry
  end

  get '/admin/update_what_we_do' do
    haml :update_what_we_do
  end

  get '/admin/update_outfit_of_the_week' do
    haml :update_outfit_of_the_week
  end

  get '/admin/update_gift_cards' do
    haml :update_gift_cards
  end





  # get '/admin/time
  #   :time
  #  end
  #
  # get '/what_we_carry/' do
  #   haml :what_we_carry
  # end

  #
  # get '/whats_new/' do
  #   haml :whats_new
  # end
  #
  # get '/gift_cards/' do
  #   haml :gift_cards
  # end
  #
  # get '/find_us' do
  #   haml :find_us
  # end
  #
  # get '/blog/' do
  #   haml :blog
  # end
  #
  # get '/mvp_club' do
  #   haml :mvp_club
  # end

end
